<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Alprestamo Web Routes
|--------------------------------------------------------------------------
|
| This module currently doesn't expose any web routes. This file exists to
| satisfy the RouteServiceProvider which expects a web.php route file.
|
*/

Route::middleware('web')->group(function (): void {
    // No web routes yet.
});
