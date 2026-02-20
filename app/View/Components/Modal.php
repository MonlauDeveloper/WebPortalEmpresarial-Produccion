<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class Modal extends Component
{

    public $attributes, $style;
    /**
     * Create a new component instance.
     */
    public function __construct($attributes = null, $style = null)
    {
        $this->attributes = $attributes;
        $this->style = $style;
    }

    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.modal');
    }
}
