<?php

namespace Modules\Front\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FrontIndexController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('front::index');
    }

}
