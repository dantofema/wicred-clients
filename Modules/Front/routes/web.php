<?php

use Illuminate\Support\Facades\Route;
use Modules\Front\Http\Controllers\IndexController;
use Modules\Front\Http\Controllers\RequestLoanController;


Route::get('/', IndexController::class)
    ->name('front.index');
/** @noinspection SpellCheckingInspection */
Route::get('/solicitar-prestamo', RequestLoanController::class)
    ->name('front.request-loan');

