<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class SearchController extends Controller
{
public function search(Request $request)
{
    $query = $request->get('q');

    $products = Product::with('images')
        ->when($query, function ($q) use ($query) {
            $q->where(function ($q1) use ($query) {
                $q1->where('product_name', 'LIKE', '%' . $query . '%')
                   ->orWhere('tags', 'LIKE', '%' . $query . '%');
            });
        })
        ->get();

    return view('frontend.searchView', [
        'products' => $products,
        'keyword' => $query, // <-- pass keyword to blade
    ]);
}



    public function suggestions(Request $request)
    {
        $query = $request->input('q');

        $products = Product::where('product_name', 'like', "%{$query}%")
            ->with(['images', 'category'])
            ->limit(10)
            ->get()
            ->map(function ($product) {
                return [
                    'name' => $product->product_name,
                    'image' => $product->images->first() ? asset('storage/' . $product->images->first()->image_path) : 'default.jpg',
                    'url' => url('/product-details/' . $product->product_id),
                ];
            });

        $categories = Product::where('product_name', 'like', "%{$query}%")
            ->with(['images', 'category'])
            ->limit(10)
            ->get()
            ->map(function ($product) {
                return [
                    'name' => $product->category?->name ?? 'Unnamed',
                    'url' => url('/shop?category_id=' . urlencode($product->category?->id)),
                ];
            })
            ->unique('name')
            ->values();

        return response()->json([
            'products' => $products,
            'categories' => $categories,
        ]);
    }

    public function findProduct(Request $request)
{
    $name = $request->input('name');

    // Try to find the product by name
    $product = Product::where('product_name', 'like', '%' . $name . '%')->first();

    if ($product) {
        return response()->json([
            // ✅ Use named route to generate correct URL
            'url' => route('showProductDetails', ['product_id' => $product->product_id]),
        ]);
    }

    return response()->json(['url' => null]);
}


}
