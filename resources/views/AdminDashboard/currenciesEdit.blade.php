@extends('AdminDashboard.master')

@section('content')
<div class="content-header">
    <h2 class="content-title">Edit Currency</h2>
</div>

<div class="card mb-4">
    <div class="card-body">
        <form action="{{ route('currencies.update', $currency->id) }}" method="POST">
            @csrf
            <!-- If you want to use PUT, uncomment below and change route method to PUT -->
            {{-- @method('PUT') --}}

            <div class="mb-3">
                <label for="code" class="form-label">Currency Code</label>
                <input type="text" class="form-control @error('code') is-invalid @enderror" id="code" name="code" value="{{ old('code', $currency->code) }}" maxlength="3" required>
                @error('code')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="name" class="form-label">Currency Name</label>
                <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" name="name" value="{{ old('name', $currency->name) }}" required>
                @error('name')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="symbol" class="form-label">Currency Symbol</label>
                <input type="text" class="form-control @error('symbol') is-invalid @enderror" id="symbol" name="symbol" value="{{ old('symbol', $currency->symbol) }}">
                @error('symbol')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="mb-3">
                <label for="exchange_rate" class="form-label">Currency Exchange Rate</label>
                <input type="text" class="form-control @error('symbol') is-invalid @enderror" id="exchange_rate" name="exchange_rate" value="{{ old('exchange_rate', $currency->exchange_rate) }}">
                @error('exchange_rate')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <div class="text-end">
                <a href="{{ route('currencies.index') }}" class="btn btn-secondary">Cancel</a>
                <button type="submit" class="btn btn-primary">Update Currency</button>
            </div>
        </form>
    </div>
</div>
@endsection
