@extends('layout.main')
@section('main')
    <!-- main -->
    <main>
      <section class="RegisterSec">
        <div class="container">
          <div class="redeemtext">
            <span>My Redeemed code</span>
          </div>
          <div class="myredeemmain">
            <table id="example" class="display" style="width: 100%">
              <thead>
                <tr>
                  <th>S.No</th>
                  <th>Email</th>
                  <th>Competition Name</th>
                  <th>Competition Date</th>
                  <th>Redeem Code</th>

                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  {{-- @dd($data) --}}
                  <td>{{ $data ? Auth::user()->email : ""}}</td>
                  <td>{{ $data ? $data->competition_name : ""}}</td>
                  <td>{{ $data ? $data->competition_date : ""}}</td>
                  <td>{{ $data ? $data->redeem_code : ""}}</td>
                </tr>

              </tbody>
              <tfoot>
                <tr>
                    <th>S.No</th>
                    <th>Email</th>
                    <th>Competition Name</th>
                    <th>Competition Date</th>
                    <th>Redeem Code</th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </section>
    </main>
    <!-- end main -->

@endsection
