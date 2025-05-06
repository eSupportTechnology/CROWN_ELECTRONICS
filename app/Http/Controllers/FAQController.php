<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FAQController extends Controller
{
    // Method to load the FAQ page
    public function index()
    {
        return view('frontend.faq');
    }
}
