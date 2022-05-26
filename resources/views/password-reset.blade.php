@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
      <section class="RegisterSec">
        <div class="container">
          <div class="registerForm">
            <span>Reset Your Password</span>
            <form action="{{route('mail_post_pass_reset')}}" method="post">
                @csrf
              <div class="labelsinside">
                <input type="email" class="form-control" placeholder="Username or Email" name="mail"/>
                <i class="fa-solid fa-face-smile"></i>
              </div>
                <span style="color: crimson">@error('mail'){{ $message }}  @enderror</span>
                @if (session('mailerror'))
                    <span style="color: crimson">Email not Registered</span>
                @endif
              <button type="submit" class="btn btn-primary">
                Reset Password
              </button>
            </form>
          </div>
          <div class="accounttext">
            <a href="{{ route('user_login') }}">Return to Login</a>
          </div>
        </div>
      </section>
    </main>
    <!-- end main -->
@endsection
