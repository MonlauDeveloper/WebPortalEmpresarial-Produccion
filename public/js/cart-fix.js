/* 
 * Script para copiar el archivo JS generado al directorio público accesible
 * Esto es necesario porque estamos usando el asset() helper de Laravel
 */
document.addEventListener('DOMContentLoaded', function() {
    const cartFixModule = document.createElement('script');
    cartFixModule.type = 'module';
    cartFixModule.textContent = `
        /**
         * Código JavaScript auxiliar para resolver problemas de visualización en el carrito
         */
        document.addEventListener('livewire:initialized', () => {
            // Añadir listener para corregir problemas de visualización del carrito
            document.addEventListener('DOMContentLoaded', fixCartButtons);
            
            // También escuchar eventos de Livewire que puedan causar re-renders
            window.addEventListener('livewire:navigating', fixCartButtons);
            window.addEventListener('livewire:navigated', fixCartButtons);
            window.addEventListener('cartUpdated', fixCartButtons);
        });

        /**
         * Función para corregir elementos del carrito que muestran wire:id en lugar de botones
         */
        function fixCartButtons() {
            // Pequeña espera para asegurar que el DOM está actualizado
            setTimeout(() => {
                // Buscar todos los elementos que potencialmente muestran wire:id
                const brokenElements = document.querySelectorAll('[wire\\\\:id]');
                
                brokenElements.forEach(element => {
                    // Revisar si este elemento es parte del componente de carrito y está roto
                    if (element.textContent.includes('wire:id') && 
                        (element.closest('.cart-container') || 
                         element.closest('#miniCart') || 
                         element.closest('.shopping-cart-container'))) {
                        
                        // Intentar forzar un re-render del componente
                        const componentId = element.getAttribute('wire:id');
                        if (componentId && window.Livewire) {
                            // Forzar actualización
                            window.Livewire.find(componentId).call('$refresh');
                        }
                    }
                });
            }, 300);
        }
    `;
    document.head.appendChild(cartFixModule);
});
