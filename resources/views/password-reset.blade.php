@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
      <section class="RegisterSec">
        <div class="container">
          <div class="registerForm">
            <span>Reset Your Password</span>
            <form>
              <div class="labelsinside">
                <input
                  type="text"
                  class="form-control"
                  placeholder="Username or Email"
                />
                <i class="fa-solid fa-face-smile"></i>
              </div>
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
