@extends('admin.layouts.main')
<link href="{{ asset('css/custom.css') }}" rel="stylesheet" />
@section('content')
    <div class="py-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                <li class="breadcrumb-item"><a href="{{route('admin_dashboard')}}"><span class="fas fa-home"></span></a></li>
                <li class="breadcrumb-item active" aria-current="page">Order</li>
            </ol>
        </nav>
        <div class="d-flex justify-content-between w-100 flex-wrap">
            <div class="mb-3 mb-lg-0">
                <h1 class="h4">Order-List</h1>
            </div>

        </div>
    </div>
    <section class="adminfilter">
        <div class="container">
            <div class="registerForm">
                <form action="{{route('order_filter')}}" method="post">
                    @csrf
                    <div class="labelsinside">
                        <label for="">Start Date</label>
                        <input class="form-control" type="date" placeholder="Select start date" name="start_date">
                    </div>
                    <div class="labelsinside">
                        <label for="">End Date</label>
                        <input class="form-control" type="date" placeholder="Select And date"  name="and_date">
                    </div>
                    <div class="labelsinside">
                        <button type="submit" class="btn btn-primary">filter</button>
                    </div>


                </form>
            </div>
        </div>
    </section>


    <div class="card border-light shadow-sm mb-4">
        <div class="card-body">
            @if(Session::has('delete'))
                <div class="alert alert-danger mb-4" id="success-alert">
                    <center><span class="text-white">{{Session::get('delete')}}</span></center>
                </div>
            @endif
            <div class="table-responsive">
                <table class="table table-centered table-nowrap mb-0 rounded" id="table_id">
                    <thead class="thead-light">
                    <tr>
                        <th class="border-0">#</th>
                        <th class="border-0">User email</th>
                        <th class="border-0">Competition Name</th>
                        <th class="border-0">Competition Date</th>
                        <th class="border-0">Price</th>
                        <th class="border-0">Redeem Code</th>
                        <th class="border-0">payment method</th>
                        <th class="border-0">Receipt</th>
                    </tr>
                    </thead>
                    <tbody>

                    <!-- Item -->
                    <!-- Start of Item -->
                    @foreach($order as $key=>$value)
                        <tr>
                            <td class="border-0"><a href="#" class="text-primary font-weight-bold">{{$key+1}}</a> </td>
                            <td class="border-0 font-weight-bold">{{$value->order_with_user->email}}</td>
                            <td class="border-0 font-weight-bold">{{$value->competition_name}}</td>
                            <td class="border-0">{{ $value->competition_date }}</td>
                            <td class="border-0">{{ $value->price }}</td>
                            <td class="border-0">{{ $value->redeem_code }}</td>
                            <td class="border-0">{{ $value->payment_method }}</td>
                            <td class="border-0"><a href="{{ $value->receipt_url }}" target="_blank">Invoice</a></td>

                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Total</td>
                        <td>{{$price}}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tfoot>
                    <!-- End of Item -->
                    <!-- Item -->

                </table>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script>
        $(document).ready( function () {
            $('#table_id').DataTable();
        } );
    </script>
@endpush
