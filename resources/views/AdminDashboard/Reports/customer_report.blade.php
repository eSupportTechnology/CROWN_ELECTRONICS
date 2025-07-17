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
                <h2 class="content-title">Report - Customers</h2>
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
                                            <th>No.</th>
                                            <th>Name</th>
                                            <th>DOB</th>
                                            <th>Email</th>
                                            <th>Phone Number</th>
                                            <th>Address</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($customers as $index => $customer)
                                            <tr>
                                                <td>{{ $index + 1 }}</td>
                                                <td>{{ $customer->name }} </td>
                                                <td>{{ $customer->dob }} </td>
                                                <td>{{ $customer->email }}</td>
                                                <td>{{ $customer->phone }}</td>
                                                <td>{{ $customer->address }}</td>

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
                            title: 'Customer Report',
                            customize: function(doc) {
                                // Set a margin for the footer
                                doc.content[1].margin = [0, 0, 0, 20];
                            }
                        },
                        {
                            extend: 'print',
                            footer: true,
                            title: 'Customer Report',
                        }
                    ],

                });


            });
        </script>



    </body>

    </html>
@endsection
