@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
      <section class="RegisterSec">
        <div class="container">
          <div class="registerForm">
            <span>Sign in to Your Account</span>
            <form action="{{ route('user_login_post') }}" method="post">
                @csrf
              <div class="labelsinside">
                <input
                  type="text"
                  class="form-control"
                  placeholder="Username or Email"
                  name="Email"
                  value="{{ session()->getOldInput('input_email') }}"
                />
                <i class="fa-solid fa-face-smile" ></i>
                <span style="color: crimson">@error('Email'){{ $message }}  @enderror</span>
                @if (session('emailerror'))
                <span style="color: crimson">Email not found</span>
                @endif
              </div>
            <a href="{{ route('user_register') }}">Register | </a>
    </main>
    <!-- end main -->
@endsection
