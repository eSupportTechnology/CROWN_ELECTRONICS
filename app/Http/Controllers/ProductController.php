<?php
namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Currency;
use App\Models\CustomerOrderItems;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Subcategory;
use App\Models\SubSubcategory;
use App\Models\Variations;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Barryvdh\DomPDF\Facade\Pdf;
class ProductController extends Controller
{

    public function searchProducts(Request $request)
    {
        $categoryId = $request->input('category');
        $keyword    = $request->input('search');
        $products   = Product::query();

        if ($keyword) {
            $products = $products->where('product_name', 'LIKE', '%' . $keyword . '%')
                ->orWhere('product_description', 'LIKE', '%' . $keyword . '%');
        }

        if ($categoryId) {
            $products = $products->where('category_id', $categoryId);
        }

        $products   = $products->get();
        $categories = Category::all();
        foreach ($products as $product) {
            $orderedQuantity         = CustomerOrderItems::where('product_id', $product->id)->sum('quantity');
            $product->sold_quantity  = $orderedQuantity;
            $product->total_quantity = $orderedQuantity + $product->quantity;

            // Calculate average rating and total reviews for only published reviews
            $product->average_rating = $product->reviews->where('status', 'Published')->avg('rating') ?? 0;
            $product->total_reviews  = $product->reviews->where('status', 'Published')->count();
        }
        return view('frontend.searchView', compact('products', 'categories', 'keyword')); // Pass keyword here
    }

    public function showproducts()
    {
        $products   = Product::with(['images', 'category'])->paginate(10);
        $categories = Category::all();

        return view('AdminDashboard.products_list', compact('products', 'categories'));
    }

    public function view_details($id)
    {
        $product = Product::with(['category', 'images'])->findOrFail($id);
        return view('AdminDashboard.product-details', compact('product'));
    }

    public function displayCategories()
    {
        $categories = Category::with('subcategories.subSubcategories')->get();
        $brands     = Brand::all();
        $currencies = Currency::all();
        return view('AdminDashboard.add_products', compact('categories', 'brands', 'currencies'));
    }

    public function getSubcategories($categoryId)
    {
        return Subcategory::where('category_id', $categoryId)->get();
    }

    public function getSubSubcategories($subcategoryId)
    {
        return SubSubcategory::where('subcategory_id', $subcategoryId)->get();
    }

    public function store(Request $request)
    {
        $request->merge([
            'is_affiliate' => $request->has('is_affiliate') ? true : false,
        ]);

        $validatedData = $request->validate([
            'product_name'           => 'required|string|max:255',
            'product_description'    => 'nullable|string',
            'category_id'            => 'required',
            'brand_id'               => 'nullable',
            'subcategory_id'         => 'nullable',
            'sub_subcategory_id'     => 'nullable',
            'currency_id'            => 'nullable',
            'quantity'               => 'required|integer',
            'tags'                   => 'nullable|string',
            'normal_price'           => 'required|numeric',
            'regular_price'          => 'required|numeric',
            'is_affiliate'           => 'boolean',
            'affiliate_price'        => 'nullable|numeric',
            'commission_percentage'  => 'nullable|numeric',
            'images'                 => 'required|array',
            'images.*'               => 'image|mimes:jpg,jpeg,png|max:2048',
            'variations'             => 'nullable|array',
            'variations.*.type'      => 'nullable|string',
            'variations.*.value'     => 'nullable|string',
            'variations.*.hex_value' => 'nullable|string',
            'variations.*.quantity'  => 'nullable|integer',
        ], [
            'product_name.required'        => 'Please enter the product name.',
            'quantity.required'            => 'Quantity is required.',
            'normal_price.required'        => 'Normal price is required.',
            'regular_price.required'       => 'Regular price is required.',
            'category_id.required'         => 'category is required',
            'brand_id.required'            => 'Brand is required',
            'product_description.required' => 'Description is required',
            'images.required'              => 'Image is required',
            'currency_id.required'         => 'currency is required',

        ]);

        $commissionPercentage = $validatedData['commission_percentage'] ?? 0;
        $affiliatePrice       = $validatedData['is_affiliate'] ? ($validatedData['normal_price'] ?? 0) : null;
        $commissionPrice      = $affiliatePrice ? ($affiliatePrice * $commissionPercentage / 100) : null;

        $product = Product::create([
            'product_id'            => 'P-' . strtoupper(substr(uniqid(), -6)),
            'product_name'          => $validatedData['product_name'],
            'product_description'   => $validatedData['product_description'],
            'category_id'           => $validatedData['category_id'],
            'brand_id'              => $validatedData['brand_id'],
            'subcategory_id'        => $validatedData['subcategory_id'],
            'sub_subcategory_id'    => $request->input('sub_subcategory_id'),
            'currency_id'           => $validatedData['currency_id'],
            'quantity'              => $validatedData['quantity'],
            'tags'                  => $validatedData['tags'],
            'normal_price'          => $validatedData['normal_price'],
            'regular_price'         => $validatedData['regular_price'],
            'is_affiliate'          => $validatedData['is_affiliate'],
            'affiliate_price'       => $affiliatePrice,
            'commission_percentage' => $commissionPercentage,
            'commission_price'      => $commissionPrice,
        ]);

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $imageName = time() . '_' . $image->getClientOriginalName();
                $imagePath = $image->storeAs('product_images', $imageName, 'public');

                ProductImage::create([
                    'product_id' => $product->product_id,
                    'image_path' => $imagePath,
                ]);
            }
        }

        if (isset($validatedData['variations'])) {
            foreach ($validatedData['variations'] as $variation) {
                Variations::create([
                    'product_id' => $product->product_id,
                    'type'       => $variation['type'],
                    'value'      => $variation['type'] === 'color' ? null : $variation['value'],
                    'hex_value'  => $variation['type'] === 'color' ? $variation['hex_value'] : null,
                    'quantity'   => $variation['quantity'],
                ]);
            }
        }

        return redirect()->route('products_list')->with('success', 'Product added successfully.');
    }

    public function destroy($productId)
    {
        $product = Product::findOrFail($productId);
        $product->delete();
        return redirect()->route('products_list')->with('success', 'Product deleted successfully');
    }

    public function edit($productId)
    {
        $product    = Product::with(['category', 'subcategory', 'subSubcategory', 'variations'])->findOrFail($productId);
        $categories = Category::with('subcategories.subSubcategories')->get();
        $brands     = Brand::all();
        $currencies = Currency::all();
        return view('AdminDashboard.edit_products', compact('product', 'categories', 'brands', 'currencies'));
    }

    public function update(Request $request, $id)
    {
        $request->merge([
            'is_affiliate' => $request->has('is_affiliate') ? true : false,
        ]);

        $validatedData = $request->validate([
            'product_name'           => 'required|string|max:255',
            'product_description'    => 'nullable|string',
            'category_id'            => 'required',
            'brand_id'               => 'nullable',
            'subcategory_id'         => 'nullable',
            'sub_subcategory_id'     => 'nullable',
            'currency_id'            => 'nullable',
            'quantity'               => 'required|integer',
            'tags'                   => 'nullable|string',
            'normal_price'           => 'required|numeric',
            'is_affiliate'           => 'boolean',
            'affiliate_price'        => 'nullable|numeric',
            'commission_percentage'  => 'nullable|numeric',
            'images'                 => 'nullable|array',
            'images.*'               => 'image|mimes:jpg,jpeg,png|max:2048',
            'deleted_images'         => 'nullable|array',
            'deleted_images.*'       => 'exists:product_images,id',
            'variations'             => 'nullable|array',
            'variations.*.id'        => 'nullable|integer|exists:variations,id',
            'variations.*.type'      => 'nullable|string',
            'variations.*.value'     => 'nullable|string',
            'variations.*.hex_value' => 'nullable|string',
            'variations.*.quantity'  => 'nullable|integer',
        ]);

        $product = Product::findOrFail($id);

        $commissionPercentage = $validatedData['is_affiliate'] ? ($validatedData['commission_percentage'] ?? 0) : 0;
        $affiliatePrice       = $validatedData['is_affiliate'] ? ($validatedData['affiliate_price'] ?? 0) : null;
        $commissionPrice      = $affiliatePrice ? ($affiliatePrice * $commissionPercentage / 100) : null;

        $product->update([
            'product_name'          => $validatedData['product_name'],
            'product_description'   => $validatedData['product_description'],
            'category_id'           => $validatedData['category_id'],
            'brand_id'              => $validatedData['brand_id'],
            'subcategory_id'        => $validatedData['subcategory_id'],
            'sub_subcategory_id'    => $validatedData['sub_subcategory_id'],
            'currency_id'           => $validatedData['currency_id'],
            'quantity'              => $validatedData['quantity'],
            'tags'                  => $validatedData['tags'],
            'normal_price'          => $validatedData['normal_price'],
            'is_affiliate'          => $validatedData['is_affiliate'],
            'affiliate_price'       => $affiliatePrice,
            'commission_percentage' => $commissionPercentage,
            'commission_price'      => $commissionPrice,
        ]);

        if (! empty($validatedData['deleted_images'])) {
            $imagesToDelete = ProductImage::whereIn('id', $validatedData['deleted_images'])->get();

            foreach ($imagesToDelete as $image) {
                if (Storage::disk('public')->exists($image->image_path)) {
                    Storage::disk('public')->delete($image->image_path);
                }
                $image->delete();
            }
        }

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $imageName = time() . '_' . $image->getClientOriginalName();
                $imagePath = $image->storeAs('product_images', $imageName, 'public');

                ProductImage::create([
                    'product_id' => $product->product_id,
                    'image_path' => $imagePath,
                ]);
            }
        }

        $variationIds = collect($request->input('variations'))->pluck('id')->filter();

        Variations::where('product_id', $product->product_id)
            ->whereNotIn('id', $variationIds)
            ->delete();

        foreach ($request->input('variations', []) as $variationData) {
            if (isset($variationData['id'])) {
                $variation = Variations::where('id', $variationData['id'])
                    ->where('product_id', $product->product_id)
                    ->first();

                if ($variation) {
                    $variation->update([
                        'type'      => $variationData['type'],
                        'value'     => $variationData['type'] === 'color' ? null : $variationData['value'],
                        'hex_value' => $variationData['type'] === 'color' ? $variationData['hex_value'] : null,
                        'quantity'  => $variationData['quantity'],
                    ]);
                }
            } else {
                Variations::create([
                    'product_id' => $product->product_id,
                    'type'       => $variationData['type'],
                    'value'      => $variationData['type'] === 'color' ? null : $variationData['value'],
                    'hex_value'  => $variationData['type'] === 'color' ? $variationData['hex_value'] : null,
                    'quantity'   => $variationData['quantity'],
                ]);
            }
        }

        return redirect()->route('products_list')->with('success', 'Product updated successfully.');
    }



public function exportPDF()
{
     $products = Product::with(['category', 'currency', 'images'])->get();

    $pdf = Pdf::loadView('AdminDashboard.Reports.product_report', compact('products'));

    return $pdf->download('product-list.pdf');
}

}
