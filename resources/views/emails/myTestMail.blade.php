<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="{{ asset('css/custom.css') }}" rel="stylesheet" />
    <title>MAIls</title>
</head>
<body>
{{--<h1>{{ $details['title'] }}</h1>--}}
{{--<p>{{ $details['body'] }}</p>--}}
<div style="text-align: center">
    <h1>Redeem Code : {{session()->get('sendEmail')['redeem_code']}}</h1>
    <h3>Competition Name : {{session()->get('sendEmail')['comp_name']}}</h3>
    <p>Amount : ${{session()->get('sendEmail')['amount']}}</p>
    <p>Competition Date : {{session()->get('sendEmail')['comp_date']}}</p>
    <p>Thank you</p>
</div>

</body>
</html>
