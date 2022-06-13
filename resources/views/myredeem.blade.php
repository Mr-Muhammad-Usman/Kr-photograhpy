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
                  <th>Name</th>
                  <th>Competition Name</th>
                  <th>Competition Date</th>
                  <th>Booking date</th>
                    <th>Price</th>
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
                  <td>{{ $item ? Auth::user()->username : ""}}</td>
                  <td>{{ $item ? $item->order_with_comp->title : ""}}</td>
                  <td>{{ $item ? $item->order_with_comp->competition_date : ""}}</td>
                  <td>{{date('Y-m-d',strtotime($item->created_at))}}</td>
                            <td>${{ $item ? $item->price : ""}}</td>
                            <td>{{ $item ? $item->redeem_code : ""}}</td>

                        </tr>
                    @endforeach


              </tbody>
              <tfoot>
                <tr>
                    <th>S.No</th>
                    <th>Name</th>
                    <th>Competition Name</th>
                    <th>Competition Date</th>
                    <th>Booking date</th>
                    <th>Price</th>
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
@include('layout.authchecker')
