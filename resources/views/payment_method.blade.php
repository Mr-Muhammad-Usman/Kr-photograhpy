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
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <a href="{{route('square_page')}}" class="">
                        <div class="payment_div">
                            <img src="images/p1.png" class="img-fluid" alt="">
                        </div>
                        <h3>Square  </h3>
                    </a>
                </div>
{{--                <div class="col-xs-12 col-sm-4 col-md-4">--}}
{{--                    <a href="{{ route('stripe_form') }}" class="">--}}
{{--                        <div class="payment_div">--}}
{{--                            <img src="images/p2.png" class="img-fluid" alt="">--}}
{{--                        </div>--}}
{{--                        <h3>Stripe  </h3>--}}
{{--                    </a>--}}
{{--                </div>--}}
                <div class="col-xs-12 col-sm-4 col-md-4">
                    <div class="payment_div">
                                               <img src="images/p3.png" class="img-fluid" alt="">
                        <form action="{{ route('charge') }}" method="post">
                            @csrf
                            <input type="hidden" value="10" name="amount">
                            <li> <button type="submit">Pay With Paypal</button></li>
                        </form>
                                          </div>

                        {{--                    <a href="#" class="">--}}
{{--                        <div class="payment_div">--}}
{{--                            <img src="images/p3.png" class="img-fluid" alt="">--}}
{{--                        </div>--}}
{{--                        <h3>Paypal </h3>--}}
{{--                    </a>--}}
                </div>
            </div>
        </div>
    </section>
</main>
@endsection
