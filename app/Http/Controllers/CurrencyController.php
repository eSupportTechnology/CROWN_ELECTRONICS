<?php

namespace App\Http\Controllers;

use App\Models\Currency;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class CurrencyController extends Controller
{
    public function index()
    {
Log::info('Accessing currencies index page');
        $currencies = Currency::all();
        return view('AdminDashboard.currencies', compact('currencies'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'code' => 'required|string|max:3|unique:currencies,code',
            'name' => 'required|string|max:255',
            'symbol' => 'nullable|string|max:10',
            'exchange_rate' => 'required|numeric|min:0',
        ]);

        Currency::create($request->only(['code', 'name', 'symbol', 'exchange_rate']));

        return redirect()->back()->with('success', 'Currency added successfully.');
    }

    public function edit($id)
    {
        $currency = Currency::findOrFail($id);
        return view('AdminDashboard.currenciesEdit', compact('currency'));
    }

    public function update(Request $request, $id)
    {
        $currency = Currency::findOrFail($id);

        $request->validate([
            'code' => 'required|string|max:3|unique:currencies,code,' . $currency->id,
            'name' => 'required|string|max:255',
            'symbol' => 'nullable|string|max:10',
            'exchange_rate' => 'required|numeric|min:0',
        ]);

        $currency->update($request->only(['code', 'name', 'symbol', 'exchange_rate']));

        return redirect()->route('currencies.index')->with('success', 'Currency updated successfully.');
    }

    public function destroy($id)
    {
        $currency = Currency::findOrFail($id);
        $currency->delete();

        return redirect()->back()->with('success', 'Currency deleted successfully.');
    }
}
