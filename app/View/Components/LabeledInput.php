<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class LabeledInput extends Component
{
    public $label, $wireModel, $type, $icon, $placeholder, $value, $disabled, $numeric, $styles;
    
    public function __construct(
        $label = null,
        $wireModel = null,
        $type = null,
        $icon = null,
        $placeholder = null,
        $value = null,
        $disabled = null,
        $numeric = null,
        $styles = null
    ) {
        $this->label = $label;
        $this->wireModel = $wireModel;
        $this->type = $type;
        $this->icon = $icon;
        $this->placeholder = $placeholder;
        $this->value = $value;
        $this->disabled = $disabled;
        $this->numeric = $numeric;
        $this->styles = $styles;
    }
    
    /**
     * Get the view / contents that represent the component.
     */
    public function render(): View|Closure|string
    {
        return view('components.labeled-input');
    }
}