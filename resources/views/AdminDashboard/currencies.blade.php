@extends ('AdminDashboard.master')

@section('content')

<div class="content-header">
    <div>
        <h2 class="content-title card-title">Currencies</h2>
    </div>
    <div>
        <button type="button" class="btn btn-primary btn-sm rounded" data-bs-toggle="modal" data-bs-target="#addCurrencyModal">Add</button>
    </div>
</div>

<div class="card mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Symbol</th>
                        <th class="text-end">Action</th>
                    </tr>
                </thead>
                <tbody>
                    @if($currencies->isEmpty())
                        <tr>
                            <td colspan="5" class="text-center">No currencies found.</td>
                        </tr>
                    @else
                        @foreach($currencies as $currency)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $currency->code }}</td>
                                <td>{{ $currency->name }}</td>
                                <td>{{ $currency->symbol }}</td>
                                <td class="text-end">
                                    <a href="{{ route('currencies.edit', $currency->id) }}" class="btn btn-warning btn-sm me-2">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="{{ route('currencies.destroy', $currency->id) }}" method="POST" style="display: inline;">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="confirmDelete('currency-form-{{ $currency->id }}', 'Are you sure you want to delete this currency?');">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    @endif
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Add Currency Modal -->
<div class="modal fade" id="addCurrencyModal" tabindex="-1" aria-labelledby="addCurrencyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Currency</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="{{ route('currencies.store') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="code" class="form-label">Currency Code</label>
                        <input type="text" class="form-control" id="code" name="code" placeholder="e.g. USD" required>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Currency Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="e.g. US Dollar" required>
                    </div>
                    <div class="mb-3">
                        <label for="symbol" class="form-label">Currency Symbol</label>
                        <input type="text" class="form-control" id="symbol" name="symbol" placeholder="e.g. $">
                    </div>
                    <div class="text-end">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Currency</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection
