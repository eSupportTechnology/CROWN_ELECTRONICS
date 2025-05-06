<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
namespace App\Http\Controllers;
use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;

class Navbar extends Controller
{
    public function getCartCount()
{
    if (Auth::check()) {
        $cartCount = CartItem::where('user_id', Auth::id())->count();
    } else {
        $cart = session()->get('cart', []);
        $cartCount = count($cart);
    }

    return view('includes.navbar-2', compact('cartCount'));
}

}
