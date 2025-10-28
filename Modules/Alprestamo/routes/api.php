<?php

declare(strict_types=1);

use Illuminate\Support\Facades\Route;
use Modules\Alprestamo\Http\Controllers\v1\RiskEvaluationController;
use Modules\Alprestamo\Http\Middleware\ValidateApiKey;

Route::group(['prefix' => 'v1', 'middleware' => ['api', ValidateApiKey::class]], function (): void {
    Route::post('/risk-evaluation', RiskEvaluationController::class);
});

// Register only if the controller exists to prevent boot-time errors in environments where this feature isn't present yet.
if (class_exists('Modules\\Alprestamo\\Http\\Controllers\\v1\\AlprestamoController')) {
    Route::group(['prefix' => 'v1/alprestamo', 'middleware' => ['api']], function (): void {
        Route::post('/loan-applications', [Modules\Alprestamo\Http\Controllers\v1\AlprestamoController::class, 'receiveLoanApplication']);
    });
}
