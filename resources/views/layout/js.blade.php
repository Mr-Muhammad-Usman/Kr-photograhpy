<script src="{{ asset('js/jquery-3.6.0.min.js') }}"></script>
<script src="{{ asset('js/wow.js') }}"></script>

<script src="{{ asset('slick/slick.js') }}"></script>
<script src="{{ asset('slick/slick.min.js') }}"></script>
<script src="{{ asset('js/jquery.slicknav.js') }}"></script>
<script src="{{ asset('js/jquery.fancybox.min.js') }}"></script>
<script src="{{ asset('js/bootstrap.js') }}"></script>
<script src="{{ asset('js/custom.js') }}"></script>
<script src="{{ asset('js/jquery.dataTables.min.js') }}"></script>
<script type="text/javascript" src="https://js.squareupsandbox.com/v2/paymentform"></script>
<script>
    $(document).ready(function () {
      $("#example").DataTable();
    });
  </script>
@stack('js')

{{-- //js toastr links --}}
<script src="{{asset('toastr_build/toastr.min.js')}}"></script>
{{-- //js toastr script --}}
<script>
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-full-width",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut",
        "setTextSize": "55"
    }
</script>
<script>
function myFunction() {
  var x = document.getElementById("password");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
</script>
<script>
    function myFunction1() {
  var y = document.getElementById("retype");
  if (y.type === "password") {
    y.type = "text";
  } else {
    y.type = "password";
  }
}
</script>
<script>
    function myFunction2() {
  var y = document.getElementById("login");
  if (y.type === "password") {
    y.type = "text";
  } else {
    y.type = "password";
  }
}
</script>

{{--Square js start--}}

    <script>
        $('#success').hide();
        const paymentForm = new SqPaymentForm({
        // Initialize the payment form elements

        //TODO: Replace with your sandbox application ID
        applicationId: "sandbox-sq0idb-uRPaRwn-RV3_rM7EUaHBSg",
        inputClass: 'sq-input',
        autoBuild: false,
        // Customize the CSS for SqPaymentForm iframe elements
        inputStyles: [{
        fontSize: '16px',
        lineHeight: '24px',
        padding: '16px',
        placeholderColor: '#a0a0a0',
        backgroundColor: 'transparent',
    }],
        // Initialize the credit card placeholders
        cardNumber: {
        elementId: 'sq-card-number',
        placeholder: 'Card Number'
    },
        cvv: {
        elementId: 'sq-cvv',
        placeholder: 'CVV'
    },
        expirationDate: {
        elementId: 'sq-expiration-date',
        placeholder: 'MM/YY'
    },
        postalCode: {
        elementId: 'sq-postal-code',
        placeholder: 'Postal'
    },
        // SqPaymentForm callback functions
        callbacks: {
        /*
        * callback function: cardNonceResponseReceived
        * Triggered when: SqPaymentForm completes a card nonce request
        */
        cardNonceResponseReceived: function (errors, nonce, cardData) {
        if (errors) {
        // Log errors from nonce generation to the browser developer console.
        console.error('Encountered errors:');
        errors.forEach(function (error) {
        console.error('  ' + error.message);
    });
        alert('Encountered errors, check browser developer console for more details');
        return;
    }
        //TODO: Replace alert with code in step 2.1
        //  alert('here is your card token ' + nonce);
        $('#success').hide();
        $.ajax({
        headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    },
        url: "{{ route('add-card') }}",
        type: "POST",
        data: {nonce},
        success: function(data){
        $('#success').show();
        console.log('data', data);
    },
        error: function (xhr, status, error) {
        console.log('error', error)
    }
    });
    }
    }
    });
        paymentForm.build();

        // onGetCardNonce is triggered when the "Pay $1.00" button is clicked
        function onGetCardNonce(event) {
        // Don't submit the form until SqPaymentForm returns with a nonce
        event.preventDefault();
        // Request a nonce from the SqPaymentForm object
        paymentForm.requestCardNonce();
    }
</script>
{{--Square js end--}}
