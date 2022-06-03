@extends('layout.main')
@section('main')
    <!-- main -->
<main>
    <section class="RegisterSec">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="main_heading text-center">
                        <h2>Payment Options</h2>
                    </div>
                </div>
{{--                <div class="col-xs-12 col-sm-4 col-md-4">--}}
{{--                    <a href="{{route('square_page')}}" class="">--}}
{{--                        <div class="payment_div">--}}
{{--                            <img src="images/p1.png" class="img-fluid" alt="">--}}
{{--                        </div>--}}
{{--                        <h3>Square  </h3>--}}
{{--                    </a>--}}
{{--                </div>--}}
{{--                <div class="col-xs-12 col-sm-4 col-md-4">--}}
{{--                    <a href="{{ route('stripe_form') }}" class="">--}}
{{--                        <div class="payment_div">--}}
{{--                            <img src="images/p2.png" class="img-fluid" alt="">--}}
{{--                        </div>--}}
{{--                        <h3>Stripe  </h3>--}}
{{--                    </a>--}}
{{--                </div>--}}
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="payment_div">
                        <img src="images/p3.png" class="img-fluid" alt="">
                        <form action="{{ route('charge') }}" method="post">
                        @csrf
                        <input type="hidden" value="10" name="amount">
                        <li> <button type="submit" {{ session()->has('free_coupon') ? 'disabled' : ''}} >Pay With Paypal</button></li>
                        </form>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="alpha">
                        <div class="container">

                                <h3>Order Recap</h3>
                                <table class="table">
                                    <thead>
                                    <tr>
                                        {{-- <th scope="col">Item</th> --}}
                                        <th scope="col">Comptition Name</th>
                                        <th scope="col">Coupon Code</th>
                                        <th scope="col">Discount Price</th>
                                        <th scope="col">Total Price</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>{{ session()->get('competition')['title'] }}</td>
                                        @if(isset(session()->get('competition')['code']))
                                        <td>{{ session()->get('competition')['code']  }}</td>
                                        <td>{{ session()->get('competition')['discount'] }}%</td>
                                        @else
                                            <td></td>
                                            <td></td>
                                        @endif
                                        <td >${{ session()->get('competition')['amount'] }} </td>
                                    </tr>
                                    </tbody>
                                </table>
                            <form action="{{ route('Coupon_discount') }}" method="post">
                                @csrf
                                <div class="labelsinside fom_input">
                                    <input autocomplete='off'
                                           class='form-control' type='text' name="code"
                                           placeholder="Enter Coupon Code...">
                                    <span style="color: crimson">@error('code'){{ $message }}  @enderror</span><br>
                                    @if (session('Redeemerror2'))
                                        <span style="color: crimson">Coupon code not found</span><br>
                                    @endif
                                    @if (session('Redeemerror1'))
                                        <span style="color: crimson">This coupon code is use only one time</span><br>
                                    @endif
                                </div>

                                @if(isset(session()->get('competition')['code']))
                                    <a href="{{route('remove_coupon')}}" class="btn btn-danger">Remove coupon</a>
                                @elseif(session()->has('free_coupon'))
                                    <a href="{{route('remove_coupon')}}" class="btn btn-danger">Remove coupon</a>
                                    <a href="{{route('free_redeem_code')}}" class="btn btn-primary">Get free Redeem code</a>
                                @else
                                    <div class="fom_2">
                                    <button type="submit" class="btn btn-primary">Add Coupon</button>
                                    </div>
                                @endif


                            </form>
                        </div>
                    </div>
{{--                    <section class="RegisterSec">--}}
{{--                        <div class="container">--}}
{{--                            <div class="registerForm" style="width: 100%">--}}
{{--                                <span>For Discount</span>--}}

{{--                            </div>--}}

{{--                        </div>--}}
{{--                    </section>--}}
                </div>
            </div>
        </div>
    </section>
</main>
@endsection
