<?php

namespace App\Livewire\Sections\Authorized;

use App\Models\Wholesaler;
use App\Models\WholesalerProduct;
use Livewire\Component;
use Livewire\WithPagination;

class WholesalerProducts extends Component
{
    use WithPagination;

    public $wholesaler;
    public $wholesalerId;
    public $filter = '';
    public $categoryFilter = null;
    public $categories = [];
    public $creating = false;
    public $name, $reference, $price, $stock, $description, $category;

    public function mount($id)
    {
        $this->wholesalerId = $id;
        $this->wholesaler = Wholesaler::with('categories')->findOrFail($id);
        $this->categories = $this->wholesaler->categories->unique('id');
    }

    public function clearFilters()
    {
        $this->filter = '';
        $this->categoryFilter = null;
        $this->resetPage();
    }

    public function filterByCategory($categoryId)
    {
        $this->categoryFilter = $categoryId;
        $this->resetPage();
    }

    public function openCreateModal()
    {
        $this->creating = true;
        $this->reset(['name', 'reference', 'price', 'stock', 'description', 'category']);
    }

    public function storeProduct()
    {
        $this->validate([
            'reference' => 'required|string|max:255',
            'name' => 'required|string|max:255',
            'price' => 'required|numeric|min:0',
            'stock' => 'required|integer|min:0',
            'description' => 'nullable|string|max:255',
            'category' => 'nullable|integer|exists:product_categories,id',
        ]);

        $product = WholesalerProduct::create([
            'wholesaler_id' => $this->wholesalerId,
            'category_id' => $this->category,
            'name' => $this->name,
            'reference' => $this->reference,
            'price' => $this->price,
            'stock' => $this->stock,
            'description' => $this->description,
        ]);
        logger('Producto creado:', $product->toArray());

        $this->creating = false;
        $this->resetPage();
    }

    public function closeModal()
    {
        $this->creating = false;
        $this->reset(['name', 'reference', 'price', 'stock', 'description', 'category']);
    }

    public function render()
    {
        $query = WholesalerProduct::where('wholesaler_id', $this->wholesalerId)
            ->where('name', 'like', '%' . $this->filter . '%');

        if ($this->categoryFilter) {
            $query->where('category_id', $this->categoryFilter);
        }

        $products = $query->orderBy('id')->paginate(12);

        // $categoryOptions = collect($this->categories)->map(function ($cat) {
        //     return [
        //         'value' => $cat->id,
        //         'label' => $cat->label
        //     ];
        // })->values()->toArray();

        return view('livewire.sections.authorized.wholesaler-products', [
            'products' => $products,
            // 'categoryOptions' => $categoryOptions
        ]);
    }
}
