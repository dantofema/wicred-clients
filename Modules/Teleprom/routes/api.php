<?php

use Illuminate\Support\Facades\Route;
use Modules\Teleprom\Http\Controllers\TelepromController;

Route::middleware(['auth:sanctum'])->prefix('v1')->group(function () {
    Route::apiResource('teleproms', TelepromController::class)->names('teleprom');
});
