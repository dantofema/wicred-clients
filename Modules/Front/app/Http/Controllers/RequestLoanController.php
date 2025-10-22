<?php

namespace Modules\Front\Http\Controllers;

use App\Http\Controllers\Controller;

final class RequestLoanController extends Controller
{

    public function __invoke()
    {
        return view('front::request-loan');
    }
}
