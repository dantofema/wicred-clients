<?php

use Illuminate\Support\Facades\Route;
use Modules\Front\Http\Controllers\IndexController;

Route::middleware(['auth:sanctum'])->prefix('v1')->group(function () {
    Route::apiResource('fronts', IndexController::class)->names('front');
});
