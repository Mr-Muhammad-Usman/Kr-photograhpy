@extends('layout.main')
<link href="{{ asset('css/square.css') }}" rel="stylesheet">

@section('main')



<main id="square_id">
    <div id="form-container" class="sq-payment-form">
        <div class="sq-field">
            <label class="sq-label">Card Number</label>
            <div id="sq-card-number">
            </div>
        </div>
        <div class="sq-field-wrapper">
            <div class="sq-field sq-field--in-wrapper">
                <label class="sq-label">CVV</label>
                <div id="sq-cvv">
                </div>
            </div>
            <div class="sq-field sq-field--in-wrapper">
                <label class="sq-label">Expiration</label>
                <div id="sq-expiration-date">
                </div>
            </div>
            <div class="sq-field sq-field--in-wrapper">
                <label class="sq-label">Postal Code</label>
                <div id="sq-postal-code">
                </div>
            </div>
        </div>
        <button id="sq-creditcard" class="button-credit-card" onclick="onGetCardNonce(event)">Pay 100</button>
        <div id="success">successfully paid</div>
    </div>
</main>
@endsection
