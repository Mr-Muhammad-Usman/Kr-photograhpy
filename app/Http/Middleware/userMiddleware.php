<?php

namespace App\Http\Middleware;

use App\Models\ordersModel;
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
        if(Auth::check() && Auth::user()->role==0)
        {
            $emails=ordersModel::where('user_id',Auth::user()->id && Auth::user()->user_role==0)->first();
            if($emails)
            {
                // dd('nahe mela');
                return redirect()->route('user-myredeem')->with('failed','you have already booked competition');
            }
            else
            {
                // dd('mel gaya');
                return $next($request);
            }
        }
        return redirect()->route('user_login')->with('failed','Loged in First');
    }
}
