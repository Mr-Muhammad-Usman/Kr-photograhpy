@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
      <section class="RegisterSec">
        <div class="container">
          <div class="registerForm">
            <span>Create an Account</span>
            <form action="{{ route('user_register_post') }}" method="post">
                @csrf
              <div class="labelsinside">
                <input
                  type="text"
                  class="form-control"
                  placeholder="Username"
                  name="Username"
                  value="{{ session()->getOldInput('Username') }}"
                />
                <i class="fa-solid fa-face-smile"></i>
                <span style="color: crimson">@error('Username'){{ $message }}  @enderror</span><br>

              </div>
              <div class="labelsinside">
                <input
                  type="email"
                  class="form-control"
                  placeholder="Email Address"
                  name="Email"
                  value="{{ session()->getOldInput('Email') }}"
                />
                <i class="fa-solid fa-envelope"></i>
                <span style="color: crimson">@error('Email'){{ $message }}  @enderror</span><br>

              </div>
              <div class="labelsinside">
                <input
                  type="password"
                  class="form-control"
                  placeholder="Password"
                  name="Pass"
                  value="{{ session()->getOldInput('Pass') }}"
                />
                <i class="fa-solid fa-eye"></i>
                <span style="color: crimson">@error('Pass'){{ $message }}  @enderror</span><br>

              </div>
              <div class="labelsinside">
                <input
                  type="password"
                  class="form-control"
                  placeholder="Confirm Password"
                  name="con_Pass"
                  value="{{ session()->getOldInput('con_Pass') }}"
                />
                <i class="fa-solid fa-eye"></i>
                <span style="color: crimson">@error('con_Pass'){{ $message }}  @enderror</span><br>

              </div>


              <button type="submit" class="btn btn-primary">Register</button>
            </form>
          </div>
          <div class="accounttext">
            <a href="{{ route('user_login') }}">Have an account? Login</a>
          </div>
        </div>
      </section>
    </main>
    <!-- end main -->
@endsection
