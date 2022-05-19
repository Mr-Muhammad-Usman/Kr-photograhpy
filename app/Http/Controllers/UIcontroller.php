<?php

namespace App\Http\Controllers;

use Stripe;
use App\Models\CompetitionModel;
use App\Models\strip_order;
use App\Models\User;
use DateTime;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Date;
use \Carbon\Carbon;

class UIcontroller extends Controller
{
    public function index()
    {
        $competition = CompetitionModel::where('status', 1)->get();
        // dd($competition);
        return view('index', compact('competition'));
    }


    public function password_reset()
    {
        return view('password-reset');
    }
    public function myredeem()
    {
        $data = strip_order::with('order_with_comp')->where('user_id', Auth::user()->id)->get();
//        dd($data);
        return view('myredeem', compact('data'));
    }
    public function login()
    {
        return view('login');
    }
    public function login_post(Request $request)
    {
        // dd($request);
        $request->validate([
            'Email' => 'required',
            'Pass' => 'min:6|required',
        ]);
        $emails = User::where('email', $request->Email)->where('user_role', 0)->first();
        $password = User::where('password', $request->Pass)->where('user_role', 0)->first();
        if ($emails) {
            if ($password) {
                // dd(session()->get('competition'));
                Auth::login($emails);
                if (session()->has('competition')) {
                    // dd(session()->get('competition'));
                    return redirect()->route('payment_method')->with('added', 'Pleace Confirm Your Payment');
                } else {
                    // dd('not have a session');
                    return redirect()->route('index')->with('added', 'Successfully');
                }
            } else {
                session()->flash('passerror');
                return back()->with('input_email', $request->log_email);
            }
        } else {
            session()->flash('emailerror');
            return back()->with('input_pass', $request->log_password);
        }
    }
    public function register()
    {
        return view('register');
    }
    public function register_post(Request $request)
    {
        // dd($request);
        $request->validate([
            'Username' => 'required|min:3|max:15|alpha',
            'Email' => 'required',
            'Pass' => 'min:6|required_with:con_Pass|same:con_Pass',
            'con_Pass' => 'required|min:8|max:15',
        ]);
        $user = new User;
        $user->username = $request->Username;
        $user->email = $request->Email;
        $user->password = $request->Pass;
        $user->user_role = 0;
        $user->save();
        Auth::login($user);
        if (session()->has('competition')) {
            // dd(session()->get('competition'));
            return redirect()->route('payment_method');
        } else {
            // dd('not have a session');
            return redirect()->route('index')->with('added', 'Register and Login Successfully');
        }

        // return redirect()->route('index');


    }
    public function competition(Request $request)
    {
//         dd($request);
        $this->validate(
            $request,
            [
                'comp' => 'required|not_in:0',
            ],
            [
                'comp.required' => 'Please select competition.',
            ]
        );
        $com=CompetitionModel::where('id',$request->comp)->first();
//        dd($com);
        session()->put('competition', [
            'id'=>$com->id,
            'title'=>$com->title,
            'date'=>$com->competition_date,
            'amount'=>$com->amount,
            'url'=>$com->url]);
//        $test=session()->get('competition');
//        dd($test['id']);
        return redirect()->route('payment_method');
    }
    public function stripe_form()
    {
        return view('stripe');
    }
    //inside controller
    public function stripe_payment($email, $token, $price, $desc)
    {

        /* stripe */
        Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
        $customer = \Stripe\Customer::create(array(
            'email' => $email,
            'source'  => $token
        ));
        $charge = Stripe\Charge::create([
            "customer" => $customer->id,
            "amount" => $price * 100,
            "currency" => "usd",
            "description" => $desc
        ]);
        return $charge;
    }
    //controller

    public function stripe_events(Request $request)
    {


        // dd($request->all());
        $stripe = $this->stripe_payment($request->email, $request->stripeToken, 10, 'Competition RedeemCode Payment');
        if ($stripe->status === "succeeded") {
            $redeem_code = date('Ymd').time().rand(111111,999999);
            $session=session()->get('competition');
            $orders = new strip_order;
            $orders->payer_id = $stripe->id;
            $orders->user_id = Auth::user()->id;
            $orders->price = 10;
            $orders->status = $stripe->status;
            $orders->redeem_code = $redeem_code;
            $orders->receipt_url = $stripe->receipt_url;
            $orders->competition_name =$session['id'] ;
            $orders->competition_date = $session['date'] ;
            $orders->url = $session['url'] ;
            $orders->payment_method = 'stripe';

            $orders->save();

            // session()->put('redeem_code', $redeem_code);

            session()->forget('competition');
            return redirect(route('user_myredeem'))->with('added', 'Thank you for purchasing...');
        } else {
            return back()->with('failed', 'Payment Failed');
        }
    }
    public function user_logout()
    {
        Auth::logout();
        session()->forget('competition');
        return back()->with('failed', 'Logout Successfully');
    }
    public function iframe()
    {
        if(session('redeem'))
        {
            $session=session()->get('redeem');
            $data=CompetitionModel::where('id',$session[1])->first();
//            dd($data->url);
            return view('iframe',compact('data'));
        }else
        {
            return redirect()->route('ui_redeem_code');
        }

    }
    public function redeem_code()
    {
        return view('redeem-code');
    }
    public function redeem_code_post(Request $request)
    {
        // dd($request);
        $request->validate([

            'redeem_code' => 'required|min:24',
        ]);
        $date = Carbon::now();
        $redeem=strip_order::where('redeem_code',$request->redeem_code)
            ->where('created_at',$date->format('Y-m-d'))
            ->first();

//        dd($redeem);

        if($redeem)
        {
            $redeem_date=strip_order::where('created_at',$date->format('Y-m-d'))->first();
            if ($redeem_date)
            {
                session()->put('redeem',[$redeem->redeem_code,$redeem->url]);
                return redirect()->route('iframe');
            }
            else
            {
                session()->flash('Redeemerror1');
                return back();
            }

        }
        else
        {
            session()->flash('Redeemerror2');
            return back();
        }

    }
    public function user_profile()
    {
        $data=User::where('id',Auth::user()->id)->first();
//        dd($data);
        return view('profile',compact('data'));
    }

    public function user_profile_post(Request $request)
    {
//        dd($request);
        $user =User::where('id',Auth::user()->id)->first();
        $user->username = $request->Username;
        $user->update();
        return back()->with('added', 'Profile Updated');
    }
    public function reset_password_post(Request $request)
    {
        $request->validate([
            'old_Pass' => 'required|min:8|max:15',
            'Pass' => 'min:8|max:15|same:con_Pass',
            'con_Pass' => 'min:8|max:15',
        ]);
        $user =User::where('id',Auth::user()->id)->first();
        $password_check=$user->where('password',$request->old_Pass)->first();
        if ($password_check)
        {
//            $user = new User;
            $user->password = $request->Pass;
            $user->update();
            return back()->with('added', 'Profile Updated');
        }
        else
        {
            return back()->with('failed', 'Password not match');
        }
//        dd($password_check);
    }
    public function payment_method()
    {
        return view('payment_method');
    }
    public function comp_ajax(Request  $req)
    {
        $comp_data=CompetitionModel::where('id',$req->name)->first();
//        dd($comp_data->competition_date);
        return response()->json([
            'status' => 1,
            'data' => $comp_data->competition_date,
        ]);
    }
}
