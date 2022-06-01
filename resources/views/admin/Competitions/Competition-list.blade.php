@extends('admin.layouts.main')
@section('content')
    <!-- Button trigger modal -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>



    <div class="py-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb breadcrumb-dark breadcrumb-transparent">
                <li class="breadcrumb-item"><a href="{{route('admin_dashboard')}}"><span class="fas fa-home"></span></a></li>
                <li class="breadcrumb-item active" aria-current="page">Competitions</li>
            </ol>
        </nav>
        <div class="d-flex justify-content-between w-100 flex-wrap">
            <div class="mb-3 mb-lg-0">
                <h1 class="h4">Competitions-List</h1>
            </div>
            <div>
                <a href="{{route('admin_Competition_add')}}" class="btn btn-outline-gray"><i class="far fa-plus-square mr-1"></i> Add New Competition</a>
            </div>
        </div>
    </div>

    <div class="card border-light shadow-sm mb-4">
        <div class="card-body">
            @if(Session::has('delete'))
                <div class="alert alert-danger mb-4" id="success-alert">
                    <center><span class="text-white">{{Session::get('delete')}}</span></center>
                </div>
            @endif
            <div class="table-responsive">
                <table class="table table-centered table-nowrap mb-0 rounded" id="table_id">
                    <thead class="thead-light">
                    <tr>
                        <th class="border-0">#</th>
                        <th class="border-0">Name</th>
                        <th class="border-0">Competition Date</th>
                        <th class="border-0">Competition Amount</th>
                        <th class="border-0">Status</th>
                        <th class="border-0">Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- Item -->
                    <!-- Start of Item -->
                    <?php
                        $data=0;
                        ?>
                    @foreach($Competition as $key=>$value)
                        <tr>
                            <td class="border-0"><a href="#" class="text-primary font-weight-bold">{{$key+1}}</a> </td>
                            <td class="border-0 font-weight-bold">{{$value->title}}</td>
                            <td class="border-0 font-weight-bold">{{$value->competition_date}}</td>
                            <td class="border-0 font-weight-bold">${{$value->amount}}</td>
                            <td class="border-0 font-weight-bold">
                                <span class="{{$value->status == 1 ? 'text-success' : 'text-danger'}}">{{$value->status == 1 ? 'Active' : 'Inactive'}}</span>
                            </td>
                            @if($value->soft_delete == null)
                                <td class="border-0">
                                    <a href="{{route('admin_Competition_edit').'/'.$value->id}}" class="text-secondary mr-3"><i class="fas fa-edit"></i>Edit</a>
                                    <span class="text-primary"> |  </span>
                                    <span  data-value="{{$value->id}}" onclick="deleteFunction({{$value->id}})" class="text-danger ml-3 deleteID" ><i class="far fa-trash-alt"></i>Delete</span>
                                </td>
                            @else
                                <td class="border-0">
                                  <span style="color: red">Deleted</span>
                                </td>
                            @endif

{{--                            {{route('admin_Competition_delete').'/'.$value->id}}--}}
{{--                            data-bs-toggle="modal" data-bs-target="#exampleModal"--}}
                        </tr>
                    @endforeach
                    <!-- End of Item -->
                    <!-- Item -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
{{--    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">--}}
{{--        Launch demo modal--}}
{{--    </button>--}}

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Attention</h5>
                    {{--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--}}
                </div>
                <div class="modal-body">
                    {{$data}}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

@endsection
@push('js')
    <script>
        $(document).ready( function () {
            $('#table_id').DataTable();
        } );
    </script>
    <script>
        function deleteFunction(myval) {

            result = confirm('If you can delete competition coupon also delete');
            // let age = prompt('',myval);
            if ( result)
            {
                var id = myval
                $.ajax({
                    url:"{{url('/admin/Competition-delete')}}",
                    type: 'post',
                    data: {
                        id:id,
                        '_token': '{{csrf_token()}}',
                    },
                    cache: false,
                    success: function(data) {
                        if(data.status == 1)
                        {
                            // alert("Done");
                            window.location.href = "{{route('admin_Competition')}}";
                            // alert(data.data);
                        }
                        else
                        {
                            alert("Error");
                        }
                        // $("#name")[0].reset();
                    }
                });
            }
        }
    </script>
@endpush
