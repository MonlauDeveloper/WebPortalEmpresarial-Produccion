<?php

namespace App\View\Components;

use Illuminate\View\Component;

class Selector extends Component
{
    public $wireModel;
    public $label;
    public $options;

    public function __construct($wireModel, $options, $label = null)
    {
        $this->wireModel = $wireModel;
        $this->options = $options;
        $this->label = $label;
    }

    public function render()
    {
        return view('components.selector');
    }
}