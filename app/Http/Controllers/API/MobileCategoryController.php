<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class MobileCategoryController extends Controller
{
    // Get all categories with subcategories and sub-subcategories
    public function index()
    {
        // Retrieve categories with their subcategories and sub-subcategories
        $categories = Category::with('subcategories.subSubcategories')->get();

        // Return the response as JSON
        return response()->json([
            'categories' => $categories
        ], 200);
    }

    // Get a single category by its ID with subcategories and sub-subcategories
    public function show($id)
    {
        $category = Category::with('subcategories.subSubcategories')->findOrFail($id);

        return response()->json([
            'category' => $category
        ], 200);
    }
}
