@extends('admin.layouts.main')
@section('content')
    <div class="py-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                <li class="breadcrumb-item"><a href="{{route('admin_dashboard')}}"><span class="fas fa-home"></span></a></li>
                <li class="breadcrumb-item"><a href="{{route('admin_Competition')}}">Coupon-List</a></li>
                <li class="breadcrumb-item active" aria-current="page">Coupon-Edit</li>
            </ol>
        </nav>
        <div class="d-flex justify-content-between w-100 flex-wrap">
            <div class="mb-3 mb-lg-0">
                <h1 class="h4">Coupon Edit</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-5 mb-4 ml-4">
                <div class="card border-light shadow-sm components-section">
                    <div class="card-body">
                        <div class="row mb-4">

                            <div class="col-lg-12 col-sm-12">
                                <!-- Form -->
                                @if(Session::has('update'))
                                    <div class="alert alert-warning mb-4" id="success-alert">
                                        <center><span class="text-white">{{Session::get('update')}}</span></center>
                                    </div>
                                @endif
                                <form action="{{route('admin_Coupon_add_edit').'/'.$Coupon->id}}" method="POST" enctype="multipart/form-data">@csrf
                                    <div class="mb-4">
                                        <label for="title">Code</label>
                                        <input type="text" class="form-control"  value="{{$Coupon->code}}" name="code">
                                    </div>
                                    <div class="my-4" id="discount">
                                        <label for="textarea">Discount</label>
                                        <input type="number" class="form-control"  name="discount"  value="{{$Coupon->discount}}">
                                    </div>
                                    <div class="my-4">
                                        <label for="textarea">Quantity</label>
                                        <input type="number" class="form-control"  name="quantity" value="{{$Coupon->quantity}}">
                                    </div>
                                    <sqan style="color: crimson">@error('quantity'){{$message}}@enderror</sqan>
                                    <div class="my-4">
                                        <label for="textarea">Competition</label>
                                        <select name="competition" id="" class="form-control">
                                            <option selected hidden value="{{$comp_value->id}}">{{$comp_value->title}}</option>
                                            @foreach($competition as $item)
                                                <option value="{{$item->id}}">{{$item->title}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <sqan style="color: crimson">@error('competition'){{$message}}@enderror</sqan>
                                    <fieldset class="my-4">
                                        <legend class="h6">Free access</legend>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="payment" id="access_no" value="1" >
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                No
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="payment" id="access_yes" value="0" >
                                            <label class="form-check-label" for="flexRadioDefault2">
                                                Yes
                                            </label>
                                        </div>
                                    </fieldset>
                                    <fieldset class="my-4">
                                        <legend class="h6">Status</legend>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="status" id="exampleRadios1" value="1" {{ $Coupon->status === 1 ? 'checked' : ''}}>
                                            <label class="form-check-label" for="exampleRadios1">
                                                Active
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="status" id="exampleRadios2" value="0" {{ $Coupon->status === 0 ? 'checked' : ''}}>
                                            <label class="form-check-label" for="exampleRadios2">
                                                Inactive
                                            </label>
                                        </div>

                                    </fieldset>
                                    <div class="my-4">
                                        <button class="btn btn-pill btn-outline-success" type="submit">Submit</button>
                                    </div>
                                </form>
                                <!-- End of Form -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('js')
    <script>

        $(document).ready(function (){
            var discount = {{$Coupon->discount}};
                if(discount == 100)
            {
                document.getElementById("discount").hidden = true;
                document.getElementById("access_yes").checked = true;
            }

            $("#access_yes").click(function(){
                document.getElementById("discount").hidden = true;
                $('#discount').val('0');
            });
            $("#access_no").click(function(){
                document.getElementById("discount").hidden = false;
                $('#discount').val(0);
            });
        });
    </script>
@endpush

