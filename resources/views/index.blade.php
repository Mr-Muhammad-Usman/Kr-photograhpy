@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
        <!-- BEGIN Banner -->
        <section class="BannerBg">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="playbtn wow zoomIn" data-wow-duration="2.s">
                            <a href="https://www.youtube.com/watch?v=D4sYONqdjCk" target="_blank"><i
                                    class="fa-solid fa-circle-play"></i></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <div class="bannerText wow fadeInRight" data-wow-duration="2.s">
                            <span>KrPhotogs <br />
                                Photography LLC</span>
                            <a href="#"><i class="fa-solid fa-play"></i> Watch Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END Banner -->
        <!-- BEGIN After Banner -->
        <section class="afterBannerSec">
            <div class="redline">
                <div class="container">
                    <div class="FormMain wow fadeInLeft" data-wow-duration="2.s">
                        <form class="row" action="{{ route('competition') }}" method="post">
                            @csrf
                            <div class="col-md-5 col-sm-5 col-xs-12">
                                <select class="form-select" aria-label="Default select example" id="comp_name" name="comp">
                                    <option selected hidden value="">pick a competition</option>
                                    @foreach ($competition as $item)
                                        <option value="{{ $item->id }}">{{ $item->title }}</option>
                                    @endforeach
                                </select>
                                <span style="color: red; font-size: 20px;">
                                    @error('comp')
                                        {{ $message }}
                                    @enderror
                                </span>
                            </div>
                            <div class="col-md-5 col-sm-5 col-xs-12">
                                    <input type="date"  disabled class="form-control" id="comp_date" value="" />
                                <span style="color: red; font-size: 20px;">
                                    @error('dates')
                                        {{ $message }}
                                    @enderror
                                </span><br>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <button type="submit" class="btn btn-primary ">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- END After Banner -->
        <!-- Banner Qasim Start  -->

        <section class="ten">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-sm-10 col-xs-12 centerCol">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="ten_1 wow fadeInRight" data-wow-delay="0.2s">
                                    <h1>Contact us</h1>
                                    <p>
                                        Inventore veritatis et quasi architecto beatae vitae dicta
                                        sunt explicabo. Nemo enim ipsam voluptatem quia voluptas
                                        sit aspernatur aut
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="ten_4 wow fadeInLeft" data-wow-delay="0.2s">
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="icon_1">
                                        <span><i class="fa-solid fa-phone"></i></span>
                                    </div>
                                    <div class="ten_3">
                                        <h6>Phone</h6>
                                        <ul>
                                            <li>
                                                <a href="tel:+123 456 7890"> +123 456 7890 </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="icon_1">
                                        <span><i class="fa-solid fa-envelope"></i></span>
                                    </div>
                                    <div class="ten_3">
                                        <h6>Email</h6>
                                        <ul>
                                            <li>
                                                <a href="mailto:kevin@krphotogs.com">
                                                    kevin@krphotogs.com</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="contact">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="contact_1 wow fadeInRight" data-wow-delay="0.2s">
                            <h1>Get in touch with us</h1>
                            <p>
                                Quasi architecto beatae vitae dicta sunt explicabo. Nemo enim
                                ipsam voluptatem quia voluptas sit aspernatur aut
                            </p>
                        </div>
                    </div>
                </div>
                <div class="contact_2 wow fadeInLeft" data-wow-delay="0.2s">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <input type="text" class="form-control" placeholder="Enter your name" />
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <input type="email" class="form-control" placeholder="Your Email" />
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-12">
                            <input type="date" class="form-control" placeholder="Birthday Month & Date
                      " />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="contact_4 wow fadeInLeft" data-wow-delay="0.2s">
                            <div class="form-floating">
                                <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2"
                                    style="height: 100px"></textarea>
                                <label for="floatingTextarea2">Your message here</label>
                            </div>
                            <button>Send to us</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Qasim  End -->

    </main>
    <!-- end main -->
@endsection
@push('js')
    <script src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <script>
        $(document).ready(function(){
            $("#comp_name").change(function(){
                // e.preventDefault();
                var name = $( "#comp_name" ).val();

                //   var formData = new FormData(this);
                $.ajax({
                    url:"{{url('comp_ajax')}}",
                    type: 'POST',
                    data: {
                        name:name,
                        '_token': '{{csrf_token()}}',
                    },
                    cache: false,
                    success: function(data) {
                        if(data !== "")
                        {
                            $('#comp_date').val(data.data);
                            // alert(data.data);
                        }
                        else
                        {
                            alert("Error");
                        }
                        // $("#name")[0].reset();
                    }
                });

            });

        });


    </script>

@endpush
