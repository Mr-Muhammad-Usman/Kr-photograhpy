@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
        <section>
{{--            @dd($session=session()->get('redeem'))--}}
{{--            {{$session=session()->get('redeem')}}--}}
            <div class="container">
                <div class="row">
                    <iframe class="ifram-redeem"

                        src="{{session()->get('redeem')['url']}}"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                </div>
            </div>
        </section>
    </main>
    <!-- end main -->
@endsection
@include('layout.authchecker')
