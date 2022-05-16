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
<?php
    $count=1;
    ?>
                  {{-- @dd($data) --}}
                    @foreach($data as $item)
                        <tr>


                  <td>{{$count ++}}</td>
                  <td>{{ $item ? Auth::user()->email : ""}}</td>
                  <td>{{ $item ? $item->competition_name : ""}}</td>
                  <td>{{ $item ? $item->competition_date : ""}}</td>
                  <td>{{ $item ? $item->redeem_code : ""}}</td>
                        </tr>
                    @endforeach


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
