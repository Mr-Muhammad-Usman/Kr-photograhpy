@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
        <section>
{{--            @dd($data->url)--}}
            <div class="container">
                <div class="row">
                    <iframe class="ifram-redeem"

                        src="{{$data->url}}"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                </div>
            </div>
        </section>
    </main>
    <!-- end main -->
@endsection
