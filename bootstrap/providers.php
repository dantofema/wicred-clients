<?php

return [
    App\Providers\AppServiceProvider::class,
    App\Providers\VoltServiceProvider::class,
    // Register module service providers so their boot() methods run (views, Livewire components, etc.)
    Modules\Front\Providers\FrontServiceProvider::class,
];
