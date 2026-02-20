<div>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 mb-4">
        <div>
            @if (count($this->wholesalers) <= 0)
                <div class="bg-gray-50 border border-gray-200 rounded-md px-3 py-2.5">
                    <p class="text-sm text-gray-500">No hay mayoristas disponibles. Por favor, seleccione uno en "Empresa".</p>
                </div>
            @else
                <x-button wireClick="openCreateModal" icon="add" content="Añadir producto" styles="bg-blue-500 text-white hover:bg-blue-600 w-full items-center justify-center" />
            @endif
        </div>
        <div class="flex items-center gap-2 bg-white border border-gray-300 rounded-md px-3 py-2">
            <span class="material-symbols-outlined text-gray-500">search</span>
            <input wire:model.live="search" type="text" placeholder="Buscar productos..."
                class="flex-1 outline-none bg-transparent">
        </div>
        <div class="w-full">
            <a href="/market/cart"
                class="flex items-center gap-2 justify-center w-full bg-blue-500 text-white rounded-md px-3 py-2.5 hover:bg-blue-600 transition-all">
                <span class="material-symbols-outlined">shopping_cart</span>
                Ver carrito
                <span id="cartCount"
                    class="bg-white text-blue-500 rounded-full h-5 w-5 flex items-center justify-center text-xs font-bold">
                    {{ $this->cartItemCount }}
                </span>
            </a>
        </div>
    </div>

    @if(!$this->company)
        <div class="mt-10 bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-md">
            <div class="flex">
                <div class="py-1">
                    <span class="material-symbols-outlined mr-2">error</span>
                </div>
                <div>
                    <p class="font-bold">No se pudo encontrar la empresa</p>
                    <p class="text-sm">Ha ocurrido un error al obtener la información de la empresa.</p>
                </div>
            </div>
        </div>
    @elseif(count($this->wholesalers) === 0)
        <div class="mt-10 bg-yellow-50 border border-yellow-200 text-yellow-800 px-4 py-3 rounded-md">
            <div class="flex">
                <div class="py-1">
                    <span class="material-symbols-outlined mr-2">warning</span>
                </div>
                <div>
                    <p class="font-bold">No hay un mayorista asignado a esta empresa</p>
                    <p class="text-sm">
                            Para asignar un mayorista vaya a la sección "Empresa" y luego Seleccione un Mayorista.

                    </p>
                </div>
            </div>
        </div>
    @endif

    @if($products->isEmpty())
        <div class="mt-10 bg-blue-50 border border-blue-200 text-blue-800 px-4 py-3 rounded-md">
            <div class="flex">
                <div class="py-1">
                    <span class="material-symbols-outlined mr-2">info</span>
                </div>
                <div>
                    <p class="font-bold">No se encontraron productos</p>
                    <p class="text-sm">Intente con otros términos de búsqueda o seleccione otro mayorista.</p>
                </div>
            </div>
        </div>
    @else
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-8">
            @foreach($products as $product)
                <div class="bg-white rounded-lg shadow-md overflow-hidden border border-gray-200 transition-all hover:shadow-lg">
                    <div class="bg-gray-100 h-48 flex items-center justify-center">
                        @if($product->image && file_exists(public_path('storage/companies/' . $product->company_id . '/products/' . $product->image)))
                            <img src="{{ asset('storage/companies/' . $product->company_id . '/products/' . $product->image) }}" alt="{{ $product->name }}"
                                class="h-full w-full object-cover">
                        @else
                            <span class="material-symbols-outlined text-gray-300 text-6xl">
                                image_not_supported
                            </span>
                        @endif
                    </div>
                    <div class="p-4">
                        <div class="flex justify-between items-start">
                            <div>
                                <h3 class="text-lg font-semibold text-gray-800">{{ $product->name }}</h3>
                                <p class="text-sm text-gray-500">
                                    {{ \App\Models\Wholesaler::find($product->wholesaler_id)->name }}
                                </p>
                            </div>
                            <div class="text-right">
                                <p class="text-lg font-bold text-blue-600">{{ $product->price }}€</p>
                            </div>
                        </div>
                        <p class="text-sm text-gray-600 mt-2 line-clamp-2">{{ $product->description }}</p>
                        <div class="flex flex-col mt-4">
                            <div class="flex items-center gap-2 mb-2">
                                <button wire:click="decrementQuantity({{ $product->id }})" type="button"
                                    class="w-8 h-8 bg-gray-200 text-gray-700 flex items-center justify-center rounded-md hover:bg-gray-300">
                                    <span class="material-symbols-outlined text-sm">remove</span>
                                </button>
                                <input type="number" wire:model="quantities.{{ $product->id }}" min="1" max="{{ $product->stock }}"
                                    class="w-12 text-center border rounded-md p-1 text-sm"
                                    @if($product->stock <= 0) disabled @endif>
                                <button wire:click="incrementQuantity({{ $product->id }}, {{ $product->stock }})" type="button"
                                    class="w-8 h-8 bg-gray-200 text-gray-700 flex items-center justify-center rounded-md hover:bg-gray-300">
                                    <span class="material-symbols-outlined text-sm">add</span>
                                </button>
                            </div>
                            <button wire:click="addToCart({{ $product->id }})" type="button"
                                class="bg-blue-500 text-white px-4 py-2 rounded-md flex items-center gap-2 hover:bg-blue-600 transition-all disabled:opacity-50 disabled:cursor-not-allowed"
                                @if($product->stock <= 0) disabled @endif>
                                <span class="material-symbols-outlined">add_shopping_cart</span>
                                Añadir al carrito
                            </button>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
        <div class="mt-8">
            {{ $products->links() }}
        </div>
    @endif

    {{-- Modal para crear producto --}}
    <x-modal wire:model="creating" styles="flex flex-col gap-3">
        <div class="flex justify-between items-center mb-3">
            <h3 class="text-lg font-bold">Añadir nuevo producto mayorista</h3>
            <button type="button" wire:click="closeCreateModal" class="p-2 hover:bg-gray-200 rounded-full">
                <x-icon label="close" />
            </button>
        </div>
        <x-labeled-input label="Nombre" wireModel="name" type="text" icon="inventory_2" />
        <x-labeled-input label="Referencia" wireModel="reference" type="text" icon="qr_code" />
        <x-labeled-input label="Precio" wireModel="price" type="number" icon="sell" />

        <label class="text-sm text-gray-500">Descripción</label>
        <textarea wire:model.live="description" rows="4" class="w-full border border-black rounded-md p-2 text-sm"
            placeholder="Descripción del producto"></textarea>

        <div>
            <div wire:loading wire:target="image">Subiendo...</div>
            <div class="flex items-center mt-3 justify-center w-full">
                <label for="dropzone-file" class="flex flex-col items-center justify-center w-full h-64 border-2 border-gray-300 border-dashed rounded-md cursor-pointer bg-gray-50">
                    <div class="flex flex-col items-center justify-center pt-5 pb-6">
                        @if($image)
                            <img src="{{ $image->temporaryUrl() }}" class="w-20 h-20 mb-5">
                        @else
                            <svg aria-hidden="true" class="w-10 h-10 mb-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path></svg>
                        @endif

                        <p class="mb-2 text-sm text-gray-500"><span class="font-semibold">Subir imagen del producto</span></p>
                        <p class="text-xs text-gray-500 pb-5">SVG, PNG, JPG o GIF</p>
                    </div>
                    <input id="dropzone-file" wire:model.live="image" type="file" class="hidden" accept="image/png, image/gif, image/jpeg" />
                </label>
            </div>
            @error('image')
                <span class="text-red-500 text-xs">{{ $message }}</span>
            @enderror
        </div>
        <div class="flex justify-end">
            <x-button wireClick="storeProduct" content="Añadir producto"
                styles="bg-blue-500 text-white hover:bg-blue-600 mt-2" />
        </div>
    </x-modal>
</div>