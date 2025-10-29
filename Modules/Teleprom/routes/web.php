<?php

use Illuminate\Support\Facades\Route;
use Modules\Teleprom\Http\Controllers\TelepromController;

Route::middleware(['auth', 'verified'])->group(function () {
    Route::resource('teleproms', TelepromController::class)->names('teleprom');
});
