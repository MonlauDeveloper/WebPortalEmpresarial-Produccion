<?php
namespace App\View\Components;

use Illuminate\View\Component;

class TextInput extends Component
{
    public $styles;
    public $wireModel;
    public $type;
    public $icon;
    public $placeholder;
    public $value;
    public $disabled;
    public $numeric;

    public function __construct(
        $styles = null,
        $wireModel = null,
        $type = 'text',
        $icon = null,
        $placeholder = null,
        $value = null,
        $disabled = false,
        $numeric = false
    ) {
        $this->styles = $styles;
        $this->wireModel = $wireModel;
        $this->type = $type;
        $this->icon = $icon;
        $this->placeholder = $placeholder;
        $this->value = $value;
        $this->disabled = $disabled;
        $this->numeric = $numeric;
    }

    public function render()
    {
        return view('components.text-input');
    }
}