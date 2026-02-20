<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class SideBarComponent extends Component {
    public $company, $name; 

    public function __construct($company = null, $name = null) {
        $this->company = $company; 
        $this->name = $name;
    }

    public function render(): View|Closure|string {
        return view('components.sidebar-component');
    }
}
