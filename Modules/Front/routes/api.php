<?php

use Illuminate\Support\Facades\Route;
use Modules\Front\Http\Controllers\FrontIndexController;

Route::middleware(['auth:sanctum'])->prefix('v1')->group(function () {
    Route::apiResource('fronts', FrontIndexController::class)->names('front');
});
