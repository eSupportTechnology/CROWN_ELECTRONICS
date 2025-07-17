<!DOCTYPE html>
<html>
<head>
    <title>Product List PDF</title>
    <style>
        body { font-family: sans-serif; font-size: 12px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #000; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
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
            @foreach($products as $product)
            <tr>
                <td>{{ $loop->iteration }}</td>
                <td>{{ $product->product_id }}</td>
                <td>{{ $product->product_name }}</td>
                <td>{{ $product->category->name ?? 'N/A' }}</td>
                <td>{{ $product->quantity }}</td>
                <td>{{ $product->currency->symbol ?? 'Rs' }} {{ $product->normal_price }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
