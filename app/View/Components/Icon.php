<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class Icon extends Component
{ 
    public $label, $styles;

    public function __construct($label = null, $styles = null)
    {
        $this->styles = $styles;
        $this->label = $label;
    }


    public function render(): View|Closure|string
    {
        return view('components.icon');
    }
}
