@extends('AdminDashboard.master')

@section('content')
    <!DOCTYPE html>
    <html>

    <head>
        <title>Product List PDF</title>
        <style>
            body {
                font-family: sans-serif;
                font-size: 12px;
                background-color: #000;
                color: #fff;
            }

            h2 {
                text-align: center;
                color: #fff;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }

            th,
            td {
                border: 1px solid #555;
                padding: 8px;
                text-align: center;
            }

            th {
                background-color: #222;
                color: #fff;
            }

            tr:nth-child(even) td {
                background-color: #111;
            }

            tr:nth-child(odd) td {
                background-color: #000;
            }

            .table tbody,
            .table tbody tr,
            .table tbody td {
                background-color: #3d3c3cb2 !important;
                color: #ffffff !important;
            }
        </style>
    </head>

    <body>
        <h2>Product List</h2>
        <table>
            <thead>
                <tr>
                    <th>#</th>
                    <th>Product ID</th>
                    <th>Product</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($products as $product)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $product->product_id }}</td>
                        <td>{{ $product->product_name }}</td>
                        <td>{{ $product->category->name ?? 'N/A' }}</td>
                        <td>{{ $product->quantity }}</td>
                        <td>{{ $product->currency->symbol ?? 'Rs' }} {{ number_format($product->normal_price, 2) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

    </body>

    </html>
@endsection
