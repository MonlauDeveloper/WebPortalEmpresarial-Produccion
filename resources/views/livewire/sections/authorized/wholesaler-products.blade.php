<div>
    <section class="flex items-center justify-between gap-5 flex-wrap">
        <x-button wireClick="openCreateModal" icon="add" content="Añadir producto"
            styles="bg-blue-500 text-white hover:bg-blue-600" />
        <div class="flex items-center bg-white gap-3 border border-black transition-all w-full flex-1 rounded-md px-3">
            <span class="material-symbols-outlined">search</span>
            <input wire:model.live="filter" type="text" class="flex-1 py-2 bg-transparent text-black"
                placeholder="Buscar productos..." />
        </div>
    </section> {{-- Categories filter --}}
    <div class="mt-5 flex flex-wrap gap-2">
        <button wire:click="clearFilters"
            class="px-4 py-2 rounded-md {{ !$categoryFilter ? 'bg-blue-500 text-white' : 'bg-gray-100' }}">
            Todos
        </button>
        @foreach($categories as $category)
            <button wire:click="filterByCategory({{ $category->id }})"
                class="px-4 py-2 rounded-md {{ $categoryFilter == $category->id ? 'bg-blue-500 text-white' : 'bg-gray-100' }}">
                {{ $category->label }}
            </button>
        @endforeach
    </div>

    {{-- Products grid --}}
    <div class="mt-10 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        @forelse($products as $product)
            <div
                class="bg-gray-50 border border-gray-200 rounded-md overflow-hidden shadow-md hover:shadow-lg transition-all">
                @if($product->image && file_exists(storage_path('app/public/products/' . $product->image)))
                    <img src="{{ asset('storage/products/' . $product->image) }}" alt="{{ $product->name }}"
                        class="w-full h-40 object-cover">
                @else
                    <div class="w-full h-40 bg-gray-200 flex items-center justify-center">
                        <span class="material-symbols-outlined text-gray-400 text-5xl">image</span>
                    </div>
                @endif

                <div class="p-4">
                    <h3 class="text-lg font-semibold text-gray-800">{{ $product->name }}</h3>
                    <div class="flex justify-between items-center">
                        <p class="text-sm text-gray-600 mt-1">
                            Ref: {{ $product->reference }}
                        </p>
                        <p class="text-xs text-blue-500 mt-1">
                            Categoría: {{ $product->category ? $product->category->label : 'Sin categoría' }}
                        </p>
                    </div>
                    <p class="text-xs text-gray-500 mt-1 line-clamp-2">
                        {{ $product->description }}
                    </p>
                    <div class="mt-3 flex items-center justify-between">
                        <span class="font-bold text-blue-600">{{ number_format($product->price, 2) }} €</span>
                    </div>
                </div>
            </div>
        @empty
            <div class="col-span-full flex flex-col items-center justify-center py-10">
                <span class="material-symbols-outlined text-5xl text-gray-400">inventory_2</span>
                <p class="mt-3 text-gray-500">No se encontraron productos</p>
            </div>
        @endforelse
    </div>

    <x-modal wire:model="creating" styles="flex flex-col gap-3">
        <div class="flex justify-between items-center mb-3">
            <h3 class="text-lg font-bold">Añadir nuevo producto mayorista</h3>
            <button type="button" wire:click="closeModal" class="p-2 hover:bg-gray-200 rounded-full">
                <x-icon label="close" />
            </button>
        </div>
        <x-labeled-input label="Referencia" wireModel="reference" type="text" icon="qr_code" />
        <x-labeled-input label="Nombre" wireModel="name" type="text" icon="inventory_2" />
        <x-labeled-input label="Precio" wireModel="price" type="number" icon="sell" />
        <x-labeled-input label="Stock" wireModel="stock" type="number" icon="inventory" />

        <label class="text-sm text-gray-500">Descripción</label>
        <textarea wire:model.live="description" rows="4" class="w-full border border-black rounded-md p-2 text-sm"
            placeholder="Descripción del producto"></textarea>
        <div class="flex justify-end">
            <x-button wireClick="storeProduct" content="Añadir producto"
                styles="bg-blue-500 text-white hover:bg-blue-600 mt-2" />
        </div>
    </x-modal>

    <div class="mt-6">
        {{ $products->links() }}
    </div>
</div>