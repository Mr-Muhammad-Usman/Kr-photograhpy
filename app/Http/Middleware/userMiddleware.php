<?php

namespace App\Http\Middleware;

use App\Models\OrdersModel;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class userMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        //
        if(Auth::check() && Auth::user()->user_role==0)
        {
            // $emails=OrdersModel::where('user_id',Auth::user()->id && Auth::user()->user_role==0)->first();
            // if($emails)
            // {
            //     return redirect()->route('user_myredeem')->with('failed','you have already booked competition');
            // }
            // else
            // {
                return $next($request);
            // }
        }
        else
            {
                return redirect()->route('user_login')->with('failed','Loged in First');
            }

    }
}
