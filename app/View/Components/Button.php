<?php

namespace App\View\Components;

use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class Button extends Component
{
    public $wireClick;
    public $icon;
    public $styles;
    public $content;

    public function __construct($wireClick = null, $icon = null, $styles = null, $content = null)
    {
        $this->wireClick = $wireClick;
        $this->icon = $icon;
        $this->styles = $styles;
        $this->content = $content;
    }

    public function render(): View|Closure|string
    {
        return view('components.button');
    }
}