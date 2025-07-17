@extends('AdminDashboard.master')

@section('content')
    <!DOCTYPE html>
    <html lang="en">
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

        .table tbody td {
            background-color: #000000;
            color: #ffffff;
        }

        .table tfoot td {
            background-color: #1a1a1a;
            color: #ffffff;
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

        .table tbody,
        .table tbody tr,
        .table tbody td {
            background-color: #3d3c3cb2 !important;
            color: #ffffff !important;
        }
    </style>

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
                <h2 class="content-title">Report - Affiliate Customer's Bank Details</h2>
            </div>

            <!-- Room Form -->
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <!-- Room Table -->
                        <div class="col-md-12">
                            <div class="table-responsive">
                                <table id="tableData" class="table table-hover display">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Name</th>
                                            <th>NIC</th>
                                            <th>Bank Name</th>
                                            <th>Branch</th>
                                            <th>Acount Name</th>
                                            <th>Account Number</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($affiliates as $index => $affiliate)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>{{ $affiliate->name }}</td>
                                                <td>{{ $affiliate->NIC }}</td>
                                                <td>{{ $affiliate->bank_name }}</td>
                                                <td>{{ $affiliate->branch }}</td>
                                                <td>{{ $affiliate->account_name }}</td>
                                                <td>{{ $affiliate->account_number }}</td>
                                                <td>{{ ucfirst($affiliate->status) }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <!-- JavaScript to handle delete confirmation -->
        <script>
            $(document).ready(function() {
                var table = $('#tableData').DataTable({
                    dom: 'Bfrtip', // Layout for DataTables with Buttons
                    buttons: [{
                            extend: 'copyHtml5',
                            footer: true
                        },
                        {
                            extend: 'excelHtml5',
                            footer: true
                        },
                        {
                            extend: 'csvHtml5',
                            footer: true
                        },
                        {
                            extend: 'pdfHtml5',
                            footer: true,
                            title: 'Affiliate Customers bank details Report',
                            customize: function(doc) {
                                // Set a margin for the footer
                                doc.content[1].margin = [0, 0, 0, 20];
                            }
                        },
                        {
                            extend: 'print',
                            footer: true,
                            title: 'Affiliate Customers Bank Details Report',
                        }
                    ],

                });


            });
        </script>



    </body>

    </html>
@endsection
