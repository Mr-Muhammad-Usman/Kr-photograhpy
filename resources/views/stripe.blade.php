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
                                <form role="form" action="{{ route('stripe.post') }}" method="POST"
                                    class="require-validation" data-cc-on-file="false"
                                    data-stripe-publishable-key="{{ env('STRIPE_KEY') }}" id="payment-form">
                                    @csrf
                                    <input type="hidden" name="price" value="10">
                                    <div class='form-row row'>
                                        <div class='col-xs-12 form-group required'>
                                            <label class='control-label'>Name on Card</label>
                                            <input class='form-control' size='4' type='text'>
                                        </div>
                                    </div>

                                    <div class='form-row row'>
                                        <div class='col-xs-12 form-group card required'>
                                            <label class='control-label'>Card Number</label> <input autocomplete='off'
                                                class='form-control card-number' maxlength="16" size='20' type='text'>
                                        </div>
                                    </div>

                                    <div class='form-row row'>
                                        <div class='col-xs-12 col-md-4 form-group cvc required'>
                                            <label class='control-label'>CVC</label> <input autocomplete='off'
                                                class='form-control card-cvc' placeholder='ex. 311' maxlength="3"
                                                type='password'>
                                        </div>
                                        <div class='col-xs-12 col-md-4 form-group expiration required'>
                                            <label class='control-label'>Expiration Month</label> <input
                                                class='form-control card-expiry-month' maxlength="2" placeholder='MM'
                                                size='2' type='text'>
                                        </div>
                                        <div class='col-xs-12 col-md-4 form-group expiration required'>
                                            <label class='control-label'>Expiration Year</label> <input
                                                class='form-control card-expiry-year' maxlength="4" placeholder='YYYY'
                                                size='4' type='text'>
                                        </div>
                                    </div>

                                    <div class='form-row row'>
                                        <div class='col-md-12 error form-group d-none'>
                                            <div class='alert-danger alert'>Please correct the errors and try
                                                again.</div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-12">

                                            <button class="btn btn-primary btn-lg btn-block" type="submit">Pay Now
                                                ($10)</button>
                                        </div>
                                    </div>
                                </form>
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
                                                <td>{{ session()->get('competition')[0] }}</td>
                                                <td>{{ session()->get('competition')[1] }}</td>
                                                <td >$10 </td>
                                            </tr>
                                            {{-- <tr>
                                <th>Shipment Charges</th>
                                <td></td>
                                <td></td>
                                <td scope="row">$100</td>
                            </tr> --}}

                                        </tbody>
                                    </table>
                                    {{-- <small>total <span> $1800</span></small> --}}
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
                    inputSelector = ['input[type=email]', 'input[type=password]',
                        'input[type=text]', 'input[type=file]',
                        'textarea'
                    ].join(', '),
                    $inputs = $form.find('.required').find(inputSelector),
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
                    Stripe.setPublishableKey($form.data('stripe-publishable-key'));
                    Stripe.createToken({
                        number: $('.card-number').val(),
                        cvc: $('.card-cvc').val(),
                        exp_month: $('.card-expiry-month').val(),
                        exp_year: $('.card-expiry-year').val()
                    }, stripeResponseHandler);
                }

            });

            function stripeResponseHandler(status, response) {
                if (response.error) {
                    $('.error')
                        .removeClass('d-none')
                        .find('.alert')
                        .text(response.error.message);
                } else {
                    // token contains id, last4, and card type
                    var token = response['id'];
                    // insert the token into the form so it gets submitted to the server
                    $form.find('input[type=text]').empty();
                    $form.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
                    $form.get(0).submit();
                }
            }

        });
    </script>
@endpush
