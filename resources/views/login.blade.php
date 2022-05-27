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
                <span style="color: crimson">mail not confirm</span>
                @endif
              </div>
              <div class="labelsinside">
                <input
                  type="password" id="login"
                  class="form-control"
                  placeholder="Password"
                  name="Pass"
                  value="{{ session()->getOldInput('input_pass') }}"
                />
                <i class="fa-solid fa-eye" onclick="myFunction2()"></i>
                <span style="color: crimson">@error('Pass'){{ $message }}  @enderror</span>
                @if (session('passerror'))
                <span style="color: crimson">Password not found</span>
                @endif
              </div>
              <button type="submit" class="btn btn-primary">Log In</button>
            </form>
          </div>
          <div class="accounttext">
            <a href="{{ route('user_register') }}">Register | </a>
            <a href="{{ route('user_pass_reset') }}">&nbsp; Lost your password?</a>
          </div>
        </div>
      </section>
    </main>
    <!-- end main -->
@endsection
