@php
function active($current_page){
    $url =  Request::segment(2);
    if($current_page == $url){
        echo 'active'; //class name in css
    }
}
@endphp

<nav class="navbar navbar-dark navbar-theme-primary px-4 col-12 d-md-none">
    <a class="navbar-brand mr-lg-5" href="#">
        {{-- <img class="navbar-brand-dark" src="{{asset('admin/assets/img/brand/light.svg')}}" alt="Volt logo" /> <img class="navbar-brand-light" src="{{asset('admin/assets/img/brand/dark.svg')}}" alt="Volt logo" /> --}}
    </a>
    <div class="d-flex align-items-center">
        <button class="navbar-toggler d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
    </div>
</nav>

        <div class="container-fluid bg-soft">
            <div class="row">
                <div class="col-12">

                    <nav id="sidebarMenu" class="sidebar d-md-block bg-primary text-white collapse" data-simplebar>
    <div class="sidebar-inner px-4 pt-3">
      <div class="user-card d-flex d-md-none align-items-center justify-content-between justify-content-md-center pb-4">
        <div class="d-flex align-items-center">
          <div class="user-avatar lg-avatar mr-4">
            {{-- <img src="{{asset('admin/assets/img/team/profile-picture-3.jpg')}}" class="card-img-top rounded-circle border-white" alt="Bonnie Green"> --}}
          </div>
          <div class="d-block">
            {{-- <h2 class="h6">Hi, Jane</h2> --}}
            {{-- <a href="#" class="btn btn-secondary text-dark btn-xs"><span class="mr-2"><span class="fas fa-sign-out-alt"></span></span>Sign Out</a> --}}
          </div>
        </div>
        <div class="collapse-close d-md-none">
            <a href="#sidebarMenu" class="fas fa-times" data-toggle="collapse"
                data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="true"
                aria-label="Toggle navigation"></a>
        </div>
      </div>
      <ul class="nav flex-column">
        <li class="nav-item  {{ active('dashboard') }} ">
          <a href="{{route('admin_dashboard')}}" class="nav-link">
            <span class="sidebar-icon"><span class="fas fa-chart-pie"></span></span>
            <span>Dashboard</span>
          </a>
        </li>

        <li class="nav-item {{ active('blog-list') . active('blog-add') . active('blog-edit') }} ">
          <a href="{{route('admin_Competition')}}" class="nav-link">
              <span class="sidebar-icon"></i><span class="fas fa-blog"></span></span>
              <span>Competition</span>
          </a>
        </li>
        <li class="nav-item {{ active('order') }}">
            <a href="{{route('order')}}" class="nav-link">
                <span class="sidebar-icon"><span class="fas fa-window-restore"></span></span>
                <span>Order</span>
                {{-- Testimonials --}}
            </a>
        </li>

        <li class="nav-item {{ active('user-list') . active('user-add') . active('user-edit') }}">
            <a href="{{route('admin_users')}}" class="nav-link">
                <span class="sidebar-icon"><span class="fas fa-users"></span></span>
                <span>Users</span>
            </a>
        </li>
          <li class="nav-item {{ active('coupon-list') . active('coupon-add') . active('coupon-edit') }}">
              <a href="{{route('admin_Coupon')}}" class="nav-link">
                  <span class="sidebar-icon"><span class="fa fa-gift"></span></span>
                  <span>Coupon</span>
              </a>
          </li>

        <li role="separator" class="dropdown-divider mt-4 mb-3 border-black"></li>

        <li class="nav-item">
          <a href="{{route('admin_logout')}}" class="nav-link d-flex align-items-center">
            <span class="sidebar-icon">
              <span class="fas fa-sign-out-alt text-danger"> </span>
            </span>
            <span class="">Logout</span>
          </a>
        </li>
      </ul>
    </div>
</nav>
<main class="content">

    <nav class="navbar navbar-top navbar-expand navbar-dashboard navbar-dark pl-0 pr-2 pb-0">
<div class="container-fluid px-0">
<div class="d-flex justify-content-between w-100" id="navbarSupportedContent">
<div class="d-flex">
</div>
<!-- Navbar links -->

</div>
</div>
</nav>
