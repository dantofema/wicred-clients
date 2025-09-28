<?php

namespace Modules\Front\Livewire;

use Livewire\Component;

class Hello extends Component
{
    public int $count = 0;

    public function increment(): void
    {
        $this->count++;
    }

    public function render()
    {
        return view('front::livewire.hello');
    }
}

