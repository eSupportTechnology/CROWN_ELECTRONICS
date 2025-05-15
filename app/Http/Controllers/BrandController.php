<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    public function showbrands()
    {
        $brands = Brand::all();

        return view('AdminDashboard.brands_list', compact('brands'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'slug' => 'required|string|unique:brands,slug',
            'image' => 'nullable|image|max:2048',
        ]);

        $imagePath = null;
        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('brands', 'public');
        }

        Brand::create([
            'name' => $request->name,
            'slug' => $request->slug,
            'image' => $imagePath,
            'is_top_brand' => $request->has('is_top_brand'),
        ]);

        return response()->json(['success' => true]);
    }
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string',
            'slug' => 'required|string|unique:brands,slug,' . $id,
            'image' => 'nullable|image|max:2048',
        ]);

        $brand = Brand::findOrFail($id);

        if ($request->hasFile('image')) {
            if ($brand->image) {
                \Storage::disk('public')->delete($brand->image);
            }
            $brand->image = $request->file('image')->store('brands', 'public');
        }

        $brand->name = $request->name;
        $brand->slug = $request->slug;
        $brand->is_top_brand = $request->has('is_top_brand');
        $brand->save();

        return back()->with('success', 'Brand updated successfully!');
    }
    public function destroy($id)
    {
        $brand = Brand::findOrFail($id);

        if ($brand->image) {
            \Storage::disk('public')->delete($brand->image);
        }

        $brand->delete();

        return back()->with('success', 'Brand image deleted successfully!');
    }

    public function edit($brandId)
    {

        $brand  = Brand::findOrFail($brandId);
        return view('AdminDashboard.edit_brand', compact('brand'));
    }

    public function getBrands()
    {
        $brands = Brand::select('name', 'slug', 'image', 'is_top_brand')->get();

        return response()->json($brands);
    }
}
