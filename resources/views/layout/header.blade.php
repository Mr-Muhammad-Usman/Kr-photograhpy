 <!-- BEGIN Header -->
 <header id="header">
     <div class="container">
         <div class="row">
             <div class="sidenav" id="mySidenav">
                 <a class="closebtn" href="javascript:void(0)" onclick="closeNav()">&times;</a>
             </div>
             <div class="mobilecontainer d-block d-sm-none">
                 <span class="pull-right" onclick="openNav()" style="font-size: 30px; cursor: pointer">&#9776;</span>
             </div>
             <div class="col-md-3 col-xs-6 col-sm-3">
                 <div class="main-logo wow fadeInLeft" data-wow-duration="2.s">
                     <div class="logo">
                         <a href="{{ route('index') }}">
                             <img loading="lazy" src="{{ asset('images/logo.png') }}" class="img-responsive"
                                 alt="Elite design hub logo" width="100%" height="50" />
                         </a>
                     </div>
                 </div>
             </div>
             <div class="col-md-9 col-sm-9 col-xs-12">
                 <div class="main-navigate wow fadeInRight" data-wow-duration="2.s">
                     <div class="navigation" id="navbar">
                         <ul class="navbar-set">
                             <li>
                                 <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                             </li>
                             <li>
                                 <a href="#"><i class="fa-brands fa-twitter"></i></a>
                             </li>
                             <li>
                                 <a href="#"><i class="fa-brands fa-instagram"></i></a>
                             </li>
                             <li>
                                 <a href="{{route('index')}}">Home</a>
                             </li>
                             @if (Auth::check() && Auth::user()->user_role == 0)
                                 <li class=""><a href="{{ route('ui_redeem_code') }}">Redeem code</a>
                                 <li class="my_dorp">
                                    <div class="dropdown">
                                        <button class="dropbtn">{{ Auth::user()->username }}</button>
                                        <div class="dropdown-content">
                                            <a href="{{ route('user_myredeem') }}">My Redeem Code</a>
                                            <a href="{{ route('user_profile') }}">Profile</a>
{{--                                            <a href="{{ route('reset_password') }}">Reset Password</a>--}}
                                            <a href="{{ route('user_logout') }}">LogOut</a>
                                        </div>
                                    </div>
                                </li>
                             @else
                                 <li class=""><a href="{{ route('user_login') }}">Login/Register</a></li>
                             @endif



                         </ul>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </header>
 <!-- END Header -->
