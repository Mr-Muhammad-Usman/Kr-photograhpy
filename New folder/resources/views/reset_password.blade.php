@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
      <section class="RegisterSec">
        <div class="container">
          <div class="registerForm">
            <span>Change Password</span>
            <form action="{{ route('change_password',[$id,$code]) }}" method="post">
                @csrf


              <div class="labelsinside">
                <input
                  type="password" id="password"
                  class="form-control"
                  placeholder="Password"
                  name="Pass"
                  value="{{ session()->getOldInput('Pass') }}"
                />
                <i class="fa-solid fa-eye" onclick="myFunction()"></i>
                <span style="color: crimson">@error('Pass'){{ $message }}  @enderror</span><br>

              </div>
              <div class="labelsinside">
                <input
                  type="password" id="retype"
                  class="form-control"
                  placeholder="Confirm Password"
                  name="con_Pass"
                  value="{{ session()->getOldInput('con_Pass') }}"
                />
                <i class="fa-solid fa-eye" onclick="myFunction1()"></i>
                <span style="color: crimson">@error('con_Pass'){{ $message }}  @enderror</span><br>

              </div>


              <button type="submit" class="btn btn-primary">Save Changes</button>
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
