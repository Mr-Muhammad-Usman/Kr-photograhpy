@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
      <section class="RegisterSec">
        <div class="container">
            <row><h2 class="user-profile-update">My Profile</h2></row>
            <div class="row">

                <div class="col-sm-6"><div class="registerForm">
                        <span>Profile</span>
                        <form action="{{ route('user_profile_post') }}" method="post">
                            @csrf

                            <div class="labelsinside">
                                <input type="text" class="form-control" name="Username" value="{{ $data->username }}"  />
                                <i class="fa-solid fa-face-smile"></i>
                                {{--                  placeholder="Username"--}}

                            </div>
                            <div class="labelsinside">
                                <input type="text" class="form-control" value="{{ $data->email }}" disabled />
                                <i class="fa-solid fa-face-smile"></i>
                                {{--                  placeholder="Username"--}}
                                {{--                  name="Username"--}}
                            </div>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
                    </div></div>
                <div class="col-sm-6"><div class="registerForm">
                        <span>Reset Password</span>
                        <form action="{{ route('reset_password_post') }}" method="post">
                            @csrf

                            <div class="labelsinside">
                                <input
                                    type="password" id="password"
                                    class="form-control"
                                    placeholder="Old Password"
                                    name="old_Pass"
                                    value="{{ session()->getOldInput('Pass') }}"
                                />
                                <i class="fa-solid fa-eye" onclick="myFunction()"></i>
                                <span style="color: crimson">@error('old_Pass'){{ $message }}  @enderror</span><br>

                            </div>
                            <div class="labelsinside">
                                <input
                                    type="password" id="retype"
                                    class="form-control"
                                    placeholder="New Password"
                                    name="Pass"
                                    value="{{ session()->getOldInput('con_Pass') }}"
                                />
                                <i class="fa-solid fa-eye" onclick="myFunction1()"></i>
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
                            <button type="submit" class="btn btn-primary">Change Password</button>
                        </form>
                    </div></div>
            </div>

        </div>
      </section>
    </main>
    <!-- end main -->
@endsection
