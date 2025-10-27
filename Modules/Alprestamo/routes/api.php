<?php

use Modules\Alprestamo\Http\Middleware\ValidateApiKey;

Route::group(['prefix' => 'v1', 'middleware' => ['api', ValidateApiKey::class]], function () {
    Route::post('/risk-evaluation', 'v1\RiskEvaluationController');
});

Route::group(['prefix' => 'v1/alprestamo', 'middleware' => ['api']], function () {
    Route::post('/loan-applications', 'v1\AlprestamoController@receiveLoanApplication');
});
