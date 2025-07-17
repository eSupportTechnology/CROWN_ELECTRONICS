@extends('AdminDashboard.master')

@section('content')
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        body {
            background-color: #000000;
            color: #ffffff;
        }

        .card {
            background-color: #1a1a1a;
            color: #ffffff;
        }

        .table thead th {
            background-color: #333333;
            color: #ffffff;
        }

        .table tfoot td {
            background-color: #1a1a1a;
            color: #ffffff;
        }

        .table tbody,
        .table tbody tr,
        .table tbody td {
            background-color: #3d3c3cb2 !important;
            color: #ffffff !important;
        }

        .dataTables_wrapper .dataTables_filter input,
        .dataTables_wrapper .dataTables_length select {
            background-color: #222;
            color: #fff;
            border: 1px solid #555;
        }

        .dt-button {
            background-color: #333 !important;
            color: white !important;
            border: 1px solid #555 !important;
        }

        .alert {
            color: #fff;
        }

        .alert-success {
            background-color: #14532d;
            border-color: #166534;
        }

        .alert-danger {
            background-color: #7f1d1d;
            border-color: #991b1b;
        }

        .dataTables_info,
        .dataTables_paginate,
        .dataTables_length,
        .dataTables_filter {
            color: #fff !important;
        }

        .paginate_button.current {
            background: #444 !important;
            color: #fff !important;
        }
    </style>
</head>

<body>
    @if (session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    @endif

    @if ($errors->any())
    <div class="alert alert-danger">
        <ul class="mb-0">
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif

    <section class="content-main">
        <div class="content-header">
            <h2 class="content-title">Report - Product List</h2>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="tableData" class="table table-hover table-bordered text-white">
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
                            @foreach ($products as $index => $product)
                            <tr>
                                <td>{{ $index + 1 }}</td>
                                <td>{{ $product->product_id }}</td>
                                <td>{{ $product->product_name }}</td>
                                <td>{{ $product->category->name ?? 'N/A' }}</td>
                                <td>{{ $product->quantity }}</td>
                                <td>{{ $product->currency->symbol ?? 'Rs' }} {{ number_format($product->normal_price, 2) }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="6" class="text-center">End of Product Report</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <!-- DataTables Script -->
    <script>
        $(document).ready(function () {
            $('#tableData').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    { extend: 'copyHtml5', footer: true },
                    { extend: 'excelHtml5', footer: true },
                    { extend: 'csvHtml5', footer: true },
                    {
                        extend: 'pdfHtml5',
                        footer: true,
                        title: 'Product Report',
                        orientation: 'landscape',
                        customize: function (doc) {
                            doc.content[1].margin = [0, 0, 0, 20];
                            doc.styles.tableHeader.fillColor = '#000000';
                            doc.styles.tableHeader.color = '#ffffff';
                        }
                    },
                    {
                        extend: 'print',
                        footer: true,
                        title: 'Product Report',
                        customize: function (win) {
                            $(win.document.body).css('background', '#000');
                            $(win.document.body).css('color', '#fff');
                            $(win.document.body).find('table').addClass('display').css('color', '#fff');
                        }
                    }
                ]
            });
        });
    </script>
</body>

</html>
@endsection
