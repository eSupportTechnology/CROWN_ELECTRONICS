<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search(Request $request)
    {
        if ($request->ajax()) {
            $query = $request->get('q');
            
            // Search products based on the query
            $products = Product::with('images') // Eager load images
                ->where('product_name', 'LIKE', '%' . $query . '%')
                ->orWhere('tags', 'LIKE', '%' . $query . '%')
                ->get();

            // Return JSON response with relevant data
            return response()->json($products);
        }
    }
}
