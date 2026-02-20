<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Wholesaler;
use App\Models\ProductCategory;
use App\Models\WholesalerProduct;
use Illuminate\Support\Facades\DB;

class AssignAllProductsToWholesalers extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'wholesaler:assign-all-products';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Asigna todos los productos a todos los mayoristas';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Iniciando asignación de todos los productos a todos los mayoristas...');

        // Obtener todos los mayoristas
        $wholesalers = Wholesaler::all();
        if ($wholesalers->isEmpty()) {
            $this->error('No hay mayoristas disponibles.');
            return 1;
        }
        
        // Obtener todas las categorías
        $categories = ProductCategory::all();
        if ($categories->isEmpty()) {
            $this->error('No hay categorías de productos disponibles.');
            return 1;
        }
        
        // Obtener todos los productos existentes
        $existingProducts = WholesalerProduct::select('name', 'reference', 'description', 'price', 'stock', 'image', 'is_office_related', 'category_id')
            ->groupBy('name', 'reference', 'description', 'price', 'stock', 'image', 'is_office_related', 'category_id')
            ->get();
        
        if ($existingProducts->isEmpty()) {
            $this->error('No hay productos existentes para asignar.');
            return 1;
        }
        
        $bar = $this->output->createProgressBar(count($wholesalers) * count($existingProducts));
        $bar->start();
        
        $this->info("Se encontraron {$wholesalers->count()} mayoristas y {$existingProducts->count()} productos.");
        
        // Para cada mayorista, asegurarse de que tenga todos los productos
        DB::beginTransaction();
        try {
            foreach ($wholesalers as $wholesaler) {
                // Los productos que ya tiene el mayorista
                $existingProductsForWholesaler = WholesalerProduct::where('wholesaler_id', $wholesaler->id)
                    ->pluck('reference')
                    ->toArray();
                
                $this->info("Mayorista: {$wholesaler->name} - Tiene {count($existingProductsForWholesaler)} productos");
                
                // Productos a agregar (todos los que no tiene ya)
                foreach ($existingProducts as $product) {
                    if (!in_array($product->reference, $existingProductsForWholesaler)) {
                        // Aplicar multiplicador aleatorio entre 0.9 y 1.10 para ventaja competitiva
                        $priceMultiplier = mt_rand(90, 110) / 100;
                        $adjustedPrice = round($product->price * $priceMultiplier, 2);
                        
                        WholesalerProduct::create([
                            'name' => $product->name,
                            'reference' => $product->reference,
                            'description' => $product->description,
                            'price' => $adjustedPrice,
                            'stock' => $product->stock,
                            'image' => $product->image,
                            'is_office_related' => $product->is_office_related,
                            'category_id' => $product->category_id,
                            'wholesaler_id' => $wholesaler->id
                        ]);
                    }
                    
                    $bar->advance();
                }
            }
            
            DB::commit();
            $bar->finish();
            $this->newLine();
            $this->info('Todos los productos han sido asignados a todos los mayoristas correctamente.');
            return 0;
            
        } catch (\Exception $e) {
            DB::rollback();
            $this->error('Error durante la asignación de productos: ' . $e->getMessage());
            return 1;
        }
    }
}
