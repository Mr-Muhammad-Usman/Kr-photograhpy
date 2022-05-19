@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
      <section class="RegisterSec">
        <div class="container">
          <div class="registerForm">
            <span>Redeem Code</span>
            <form action="{{ route('redeem_code_post') }}" method="post">
                @csrf
              <div class="labelsinside">
                <input autocomplete='off'
                    class='form-control' maxlength="24" size='25' type='text' name="redeem_code"
                placeholder="Enter Redeem Code...">
                <span style="color: crimson">@error('redeem_code'){{ $message }}  @enderror</span><br>
                @if (session('Redeemerror1'))
                <span style="color: crimson">Redeem code not found</span><br>
                @endif
                  @if (session('Redeemerror2'))
                      <span style="color: crimson">This Redeem code is use only for competition date</span><br>
                  @endif
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>
          </div>

        </div>
      </section>
    </main>
    <!-- end main -->
@endsection
