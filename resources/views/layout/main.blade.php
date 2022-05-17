<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,600" rel="stylesheet">
        <!-- CSRF Token square-->
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <!-- Bootstrap CSS -->
        @include('layout.css')
        <title>KrPhotogs Photography</title>
        <style>
            #toast-container *{
               font-size:100% !important;
            }
    </style>
      </head>
<body>
    @include('layout.header')
    @yield('main')
    {{-- show toastr message in blade --}}
@push('js')
                                 <script>
                                    $(document).ready(function() {
                                       @if(Session::has('added'))
                                          toastr["success"](' {{ Session::get('added') }}');
                                       @endif
                                       @if(Session::has('failed'))
                                          toastr["error"]('{{ Session::get('failed') }}');
                                       @endif
                                       @if(Session::has('out_of_stock'))
                                            toastr["error"]('{{ Session::get('out_of_stock') }}');
                                       @endif
                                       @if(Session::has('already_exist'))
                                            toastr["error"]('{{ Session::get('already_exist') }}');
                                       @endif
                                    });
                                 </script>
                                 @endpush
    @include('layout.footer')
    @include('layout.js')

</body>
</html>
