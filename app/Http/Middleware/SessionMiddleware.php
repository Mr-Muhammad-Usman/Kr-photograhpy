<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class SessionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
//        dd(Auth::user()->user_role==1);
        if(Auth::user() && Auth::user()->user_role==1){
            return $next($request);
        }
        else
        {
            return redirect(route('admin_login'));
        }


    }
}
