<?php

use Illuminate\Support\Facades\Route;
use Modules\Front\Http\Controllers\FrontIndexController;


Route::resource('/', FrontIndexController::class)->names('front.index');

