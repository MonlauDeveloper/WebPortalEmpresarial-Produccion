<?php

namespace App\Livewire\Sections\Authorized;
use Livewire\Component;
use App\Models\Product; 
use App\Models\Company;
use Livewire\WithPagination;
use Livewire\Attributes\Url;

class Market extends Component {
    use WithPagination;

    #[Url] 
    public $product_filter, $sector, $company_filter;

    public $marketQuestions = [
        [
            "index" => "english_availability", 
            "title" => "Damos respuesta en inglés", 
        ],
        [
            "index" => "vacations",
            "title" => "Estamos de vacaciones", 
        ], 
        [
            "index" => "messages",
            "title" => "Mensajería unificada", 
        ], 
        [
            "index" => "public_email",
            "title" => "Email público", 
        ]
    ]; 

    protected $products = []; 
    public $companies = [];

    public function render() {
        $queryBuilder = Product::query();

        if ($this->product_filter) {
            $queryBuilder->where('label', 'LIKE', '%' . $this->product_filter . '%');
        }

        if ($this->sector) {
            $queryBuilder->whereHas('company', function ($query) {
                $query->where('sector', $this->sector);
            });
        }

        if ($this->company_filter) {
            $queryBuilder->where('company_id', $this->company_filter);
        }

        $this->products = $queryBuilder->get();
        $this->companies = Company::whereHas('products')->orderBy('name')->get(['id', 'name']);
    
        return view('livewire.sections.authorized.market');
    }
}
