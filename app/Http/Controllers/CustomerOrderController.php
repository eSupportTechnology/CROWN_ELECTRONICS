<?php
namespace App\Http\Controllers;

use App\Models\AffiliateReferral;
use App\Models\CustomerOrder;
use App\Models\CustomerOrderItems;
use App\Models\Product;
use App\Models\RaffleTicket;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class CustomerOrderController extends Controller
{

    public function trackReferral($tracking_id, $product_id)
    {
        // Retrieve tracking ID and affiliate user ID from session
        $affiliate_user_id = session('affiliate_user_id');

        // Find the raffle ticket using the tracking ID
        $raffleTicket = RaffleTicket::where('token', $tracking_id)->first();

        if ($raffleTicket) {
            $product_url = url('product-details/' . $product_id);

            $referral = AffiliateReferral::where('raffle_ticket_id', $raffleTicket->id)
                ->where('product_url', $product_url) // Match against product_url
                ->where('user_id', $affiliate_user_id)
                ->first();

            if ($referral) {
                // Increment referral count
                $referral->increment('referral_count');

                // Log success

                return true;
            } else {

            }
        } else {
            // Log if raffle ticket is not found
        }

        return false;
    }

    public function placeOrder(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name'  => 'required|string|max:255',
            'last_name'   => 'required|string|max:255',
            'phone'       => 'required|string|max:15',
            'email'       => 'required|email',
            'house_no'    => 'required|string|max:255',
            'city'        => 'required|string|max:255',
            'postal_code' => 'required|string|max:10',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        try {
            $user = Auth::user();

            $cartItems = \App\Models\CartItem::where('user_id', $user->id)->get();

            // Check if cart is empty
            if ($cartItems->isEmpty()) {
                return redirect()->back()->with('error', 'Your cart is empty.');
            }

            $orderCode = 'ORD-' . strtoupper(Str::random(8));

            $total = $cartItems->sum(function ($item) {
                $product  = $item->product;
                $subtotal = $item->subtotal;

                if ($product && $product->currency && $product->currency->code !== 'LKR') {
                    return $subtotal * $product->currency->exchange_rate;
                }

                return $subtotal;
            });

            // Calculate order totals
            // $subtotal = $cartItems->sum('subtotal');
            // $deliveryFee = 300.00;
            // $totalCost = $subtotal + $deliveryFee;

            $subtotal    = $total;
            $deliveryFee = 300.00;
            $totalCost   = $subtotal + $deliveryFee;

            $customerName = $request->input('first_name') . ' ' . $request->input('last_name');

            $order = CustomerOrder::create([
                'order_code'     => $orderCode,
                'user_id'        => $user->id,
                'customer_name'  => $customerName,
                'phone'          => $request->input('phone'),
                'email'          => $request->input('email'),
                'house_no'       => $request->input('house_no'),
                'apartment'      => $request->input('apartment'),
                'city'           => $request->input('city'),
                'postal_code'    => $request->input('postal_code'),
                'date'           => Carbon::now()->format('Y-m-d'),
                'total_cost'     => $totalCost,
                'status'         => 'Pending',
                'payment_method' => $request->input('payment_method', null),
                'payment_status' => 'Pending',
            ]);

            foreach ($cartItems as $cartItem) {
                if (! isset($cartItem->product_id, $cartItem->quantity, $cartItem->price)) {
                    continue;
                }

                // Reduce the quantity of the product
                $product = \App\Models\Product::find($cartItem->product_id);
                if ($product) {
                    $product->quantity = max(0, $product->quantity - $cartItem->quantity);
                    $product->save();

                }

                CustomerOrderItems::create([
                    'order_code' => $orderCode,
                    'product_id' => $cartItem->product_id,
                    'date'       => Carbon::now()->format('Y-m-d'),
                    'cost'       => $cartItem->subtotal,
                    'quantity'   => $cartItem->quantity,
                    'size'       => $cartItem->size ?? null,
                    'color'      => $cartItem->color ?? null,
                ]);
            }

            // Clear the cart items from the database after the order is placed
            \App\Models\CartItem::where('user_id', $user->id)->delete();

            return redirect()->route('payment', ['order_code' => $orderCode]);
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while placing the order. Please try again.');
        }
    }

    public function buynow_placeOrder(Request $request)
    {
        $request->validate([
            'first_name'            => ['required', 'string', 'max:100'],
            'last_name'             => ['required', 'string', 'max:100'],
            'house_no'              => ['required', 'string', 'max:255'],
            'apartment'             => ['nullable', 'string', 'max:255'],
            'city'                  => ['required', 'string', 'max:100'],
            'postal_code'           => ['required', 'string', 'max:20'],
            'phone'                 => ['required', 'digits_between:9,15'],
            'email'                 => ['required', 'email', 'max:255'],
            'payment_method'        => ['nullable', 'string'],
            'products'              => ['required', 'array'],
            'products.*.product_id' => ['required', 'integer', 'exists:products,id'],
            'products.*.quantity'   => ['required', 'integer', 'min:1'],
            'products.*.cost'       => ['required', 'numeric', 'min:0'],
            'products.*.size'       => ['nullable', 'string'],
            'products.*.color'      => ['nullable', 'string'],
        ]);

        $userId      = Auth::id();
        $orderCode   = 'ORD-' . strtoupper(Str::random(8));
        $deliveryFee = 300;
        $subtotal    = 0;

        // Calculate subtotal
        foreach ($request->products as $product) {
            $productRecord = Product::find($product['product_id']);
            if ($productRecord->currency && $productRecord->currency->code !== 'LKR') {
                $product['cost'] = $product['cost'] * $productRecord->currency->exchange_rate;
            }
            $itemSubtotal = $product['cost'] * $product['quantity'];
            $subtotal += $itemSubtotal;
        }

        $total = $subtotal + $deliveryFee;

        // Create order
        $order = CustomerOrder::create([
            'order_code'     => $orderCode,
            'user_id'        => $userId,
            'customer_name'  => $request->first_name . ' ' . $request->last_name,
            'phone'          => $request->phone,
            'email'          => $request->email,
            'house_no'       => $request->house_no,
            'apartment'      => $request->apartment,
            'city'           => $request->city,
            'postal_code'    => $request->postal_code,
            'date'           => Carbon::now(),
            'total_cost'     => $total,
            'status'         => 'Pending',
            'payment_method' => $request->input('payment_method', null),
            'payment_status' => 'Pending',
        ]);

        // Add items
        foreach ($request->products as $product) {
            $itemSubtotal = $product['cost'] * $product['quantity'];
            CustomerOrderItems::create([
                'order_code' => $orderCode,
                'product_id' => $product['product_id'],
                'quantity'   => $product['quantity'],
                'size'       => $product['size'],
                'color'      => $product['color'],
                'cost'       => $itemSubtotal,
                'date'       => Carbon::now(),
            ]);
        }

        // Decrease stock
        foreach ($request->products as $product) {
            Product::find($product['product_id'])->decrement('quantity', $product['quantity']);
        }

        // Handle affiliate tracking (if exists)
        if (session()->has('tracking_id')) {
            $tracking_id  = session('tracking_id');
            $raffleTicket = RaffleTicket::where('token', $tracking_id)->first();

            if ($raffleTicket) {
                foreach ($request->products as $product) {
                    $productRecord = Product::find($product['product_id']);
                    if ($productRecord) {
                        $productUrlPart = $productRecord->product_id;
                        $referral       = AffiliateReferral::where('raffle_ticket_id', $raffleTicket->id)
                            ->where('product_url', 'like', '%' . $productUrlPart . '%')
                            ->first();

                        if ($referral) {
                            $referral->increment('referral_count');
                            $referral->increment('total_affiliate_price', $referral->affiliate_commission);
                        }
                    }
                }
            }

            session()->forget('tracking_id');
        }

        return redirect()->route('payment', ['order_code' => $orderCode]);
    }

}
