@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
        <section class="RegisterSec">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 ">
                        <div class="alpha">
                            <div class="container">
                                <form role="form" action="{{route('stripe.post')}}" method="post" class="require-validation" data-cc-on-file="false" data-stripe-publishable-key="{{ env('STRIPE_KEY') }}" id="payment-form">
                                    @csrf
                                    <div class='form-row row'>
                                    </div>
                                    <div class='form-row row'>
                                        <div class='col-md-12 col-sm-12 col-xs-12 form-group required'>
                                            <div class="my_re">
                                                <label class='control-label'>Name on Card</label>
                                                <input class='form-control' name="card_name" size='4' type='text' id="name">
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class='form-row row'>
                                        <div class='col-md-12 col-sm-12 col-xs-12 form-group '>
                                            <div class="my_re">
                                                <label class='control-label'>Card Number</label>
                                                <input autocomplete='off' name="card_number" class='form-control card-number' maxlength="16" size='20' type='text' id="cart_no">
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class='form-row row'>
                                        <div class='col-xs-12 col-md-4 form-group cvc required'>
                                            <label class='control-label'>CVC</label> <input autocomplete='off' name="card_cvc" class='form-control card-cvc' placeholder='ex. 311' maxlength="3" type='password' id="cvc">
                                        </div>
                                        <div class='col-xs-12 col-md-4 form-group expiration required'>
                                            <label class='control-label'>Expiration Month</label> <input name="card_exp_month" class='form-control card-expiry-month' maxlength="2" placeholder='MM' size='2' type='text' id="e_month">
                                        </div>
                                        <div class='col-xs-12 col-md-4 form-group expiration required'>
                                            <label class='control-label'>Expiration Year</label> <input name="card_exp_year" class='form-control card-expiry-year' maxlength="4" placeholder='YYYY' size='4' type='text' id="e_year">
                                        </div>
                                    </div>
                                    <br>
                                    <div class='form-row row'>
                                        <div class='col-md-12 error form-group d-none'>
                                            <div class='alert-danger alert'>Please correct the errors and try
                                                again.</div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="agreedcheck">
                                                <label class="form-check-label" for="agreedcheck">
                                                    I Agreed to the <a class="text-danger" href="#">Terms&Conditions</a>  of KR-photography.
                                                </label>
                                                <br>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <button id="paynow" class="btn btn-danger btn-lg btn-block" type="submit" onClick="myFunction()">Pay Now ($10)</button>
                                        </div>
                                    </div>
{{--                                </form>--}}
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 ">
                        <div class="alpha">
                            <div class="container">
                                <div>
                                    <h3>Order Recap</h3>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                {{-- <th scope="col">Item</th> --}}
                                                <th scope="col">Comptition Name</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                {{-- <th>Brandix Spark Plug Kit</th> --}}
                                                <td>{{ session()->get('competition')['title'] }}</td>
                                                <td>{{ session()->get('competition')['date'] }}</td>
                                                <td >${{ session()->get('competition')['amount'] }} </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </main>
    <!-- end main -->
@endsection
@push('js')
    <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
    <script type="text/javascript">
        $(function() {
            var $form = $(".require-validation");
            $('form.require-validation').bind('submit', function(e) {
                var $form = $(".require-validation"),
                    inputSelector = ['input[type=email]',
                        'input[type=password]',
                        'input[type=text]', 'input[type=file]',
                        'textarea'
                    ].join(', '),
                    $inputs = $form.find('.required').find(
                        inputSelector),
                    $errorMessage = $form.find('div.error'),
                    valid = true;
                $errorMessage.addClass('hide');
                $('.has-error').removeClass('has-error');
                $inputs.each(function(i, el) {
                    var $input = $(el);
                    if ($input.val() === '') {
                        $input.parent().addClass('has-error');
                        $errorMessage.removeClass('hide');
                        e.preventDefault();
                    }
                });
                if (!$form.data('cc-on-file')) {
                    e.preventDefault();
                    Stripe.setPublishableKey($form.data(
                        'stripe-publishable-key'));
                    Stripe.createToken({
                        number: $('.card-number').val(),
                        cvc: $('.card-cvc').val(),
                        exp_month: $('.card-expiry-month')
                            .val(),
                        exp_year: $('.card-expiry-year').val()
                    }, stripeResponseHandler);
                }
            });
            $('#paynow').prop('disabled', true);
            $('#agreedcheck').click(function() {
                let checkvalues = false;
                if ($('#name').val() == '' ||
                    $('#cart_no').val() == '' ||
                    $('#cvc').val() == '' ||
                    $('#e_month').val() == '' ||
                    $('#e_year').val() == ''
                ) {
                    checkvalues = false;
                    $('#agreedcheck').prop('checked', false);
                } else {
                    checkvalues = true;
                }
                if (checkvalues == true) {
                    if ($(this).is(':checked')) {
                        $('#paynow').prop('disabled', false);
                    } else {
                        $('#paynow').prop('disabled', true);
                    }
                } else {
                    alert('Fill all input fields');
                }
            });
            function stripeResponseHandler(status, response) {
                if (response.error) {
                    $('.error')
                        .removeClass('d-none')
                        .find('.alert')
                        .text(response.error.message);
                    $('.preloader').removeClass('block').addClass('d-none');
                } else {
                    // token contains id, last4, and card type
                    var token = response['id'];
                    // insert the token into the form so it gets submitted to the server
                    $form.find('input[type=text]').empty();
                    $form.append(
                        "<input type='hidden' name='stripeToken' value='" +
                        token + "'/>");
                    $form.get(0).submit();
                }
            }

        });
    </script>
    @endpush

    </form>
    @include('layout.authchecker')
