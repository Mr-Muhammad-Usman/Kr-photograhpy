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
        $data = strip_order::where('user_id', Auth::user()->id)->first();
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
                    return redirect()->route('stripe_form')->with('added', 'Pleace Confirm Your Payment');
                } else {
                    // dd('not have a session');
                    return redirect()->route('user_myredeem')->with('added', 'Successfully');
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
            return redirect()->route('stripe_form');
        } else {
            // dd('not have a session');
            return redirect()->route('index')->with('added', 'Register and Login Successfully');
        }

        // return redirect()->route('index');


    }
    public function competition(Request $request)
    {
        // dd($request);
        $this->validate(
            $request,
            [
                'comp' => 'required|not_in:0',
                'dates' => 'required',
                // 'Pass'=>'min:6|required',
            ],
            [
                'comp.required' => 'Please select competition.',
                'dates.required' => 'Please select date.',
            ]
        );
        session()->put('competition', [$request->comp, $request->dates]);
        return redirect()->route('stripe_form');
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
            $redeem_code = date('Ymd') . time() . rand(567891, 567891);
            $orders = new strip_order;
            $orders->payer_id = $stripe->id;
            $orders->user_id = Auth::user()->id;
            $orders->price = $request->price;
            $orders->status = $stripe->status;
            $orders->redeem_code = $redeem_code;
            $orders->receipt_url = $stripe->receipt_url;
            $orders->competition_name = session()->get('competition')[0];
            $orders->competition_date = session()->get('competition')[1];
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
        return redirect()->route('index')->with('failed', 'Logout Successfully');
    }
    public function iframe()
    {
        if(session('redeem'))
        {
            return view('iframe');
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
        $redeem=strip_order::where('redeem_code',$request->redeem_code)->first();

        if($redeem)
        {
            session()->put('redeem',$redeem->redeem_code);
            // dd(session()->get('redeem'));
            return redirect()->route('iframe');
        }
        else
        {
            session()->flash('Redeemerror');
            return back();
        }

    }
}
