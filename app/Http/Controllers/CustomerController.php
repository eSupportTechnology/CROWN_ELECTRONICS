<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\CustomerOrder;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class CustomerController extends Controller
{

    public function show()
    {
        $customers = User::withCount('customerOrders')->paginate(9);

        return view('AdminDashboard.customer', compact('customers'));
    }


    public function showCustomerDetails($user_id)
    {
        $customer = User::findOrFail($user_id);

        $orders = CustomerOrder::where('user_id', $user_id)
            ->with('items.product')
            ->get();

        $totalCost = $orders->sum('total_cost');
        $totalOrders = $orders->count();
        $totalProducts = $orders->sum(function ($order) {
            return $order->items->sum('quantity');
        });

        return view('AdminDashboard.customer-details', compact('customer', 'orders', 'totalCost', 'totalOrders', 'totalProducts'));
    }

    public function export()
{
    $customers =User::withCount('customerOrders')->get();

    $pdf = Pdf::loadView('AdminDashboard.Reports.customer_report', compact('customers'));

    return $pdf->download('customers_report.pdf');
}
}
