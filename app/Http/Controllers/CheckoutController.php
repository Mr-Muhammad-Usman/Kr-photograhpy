<?php

namespace App\Http\Controllers;

// use Illuminate\Contracts\Session\Session as SessionSession;

use App\Models\CompetitionModel;
use App\Models\Payment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Stripe;
use Session;
use Omnipay\Omnipay;
use Illuminate\Http\Request;
use App\Models\strip_order;

class CheckoutController extends Controller
{
    public function afterpayment(Request $req)
    {
//        $total_price=session()->get('quty_Tprice') + 15;
        // dd($total_price);
    	Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
    	$data = Stripe\Charge::create([
    			"amount"=>10*100,
    			"currency"=>"usd",
    			"source"=>$req->stripeToken,
    			"description"=>$req->card_name,
    	]);
        // echo "<pre>"; print_r($data); die();

    	// Session::flash("success","Payment successfully!");

    	// return back()->with("success","Payment successfully!");
        return redirect()->route('PTC_checkout');

    }
    // public function afterPayment()
    // {
    //     echo 'Payment Received, Thanks you for using our services.';
    // }
    public function checkout()
    {
        return view('checkout.credit-card');
    }



















    private $gateway;

    public function __construct()
    {
        $this->gateway = Omnipay::create('PayPal_Rest');
        $this->gateway->setClientId(env('PAYPAL_CLIENT_ID'));
        $this->gateway->setSecret(env('PAYPAL_CLIENT_SECRET'));
        $this->gateway->setTestMode(true); //set it to 'false' when go live
    }



    /**
     * Initiate a payment on PayPal.
     *
     * @param  \Illuminate\Http\Request  $request
     */
    public function charge(Request $request)
    {
        // dd($request);


                $response = $this->gateway->purchase(array(
                    'amount' => $request->input('amount'),
                    'currency' => env('PAYPAL_CURRENCY'),
                    'returnUrl' => url('success'),
                    'cancelUrl' => url('error'),
                ))->send();

                if ($response->isRedirect()) {
                    $response->redirect(); // this will automatically forward the customer
                } else {
                    // not successful
                    return $response->getMessage();
                }


    }

    /**
     * Charge a payment and store the transaction.
     *
     * @param  \Illuminate\Http\Request  $request
     */
    public function success(Request $request)
    {
        // Once the transaction has been approved, we need to complete it.
        if ($request->input('paymentId') && $request->input('PayerID'))
        {
            $transaction = $this->gateway->completePurchase(array(
                'payer_id'             => $request->input('PayerID'),
                'transactionReference' => $request->input('paymentId'),
            ));
            $response = $transaction->send();

            if ($response->isSuccessful())
            {
                $arr_body = $response->getData();
//dd($arr_body);
                // Insert transaction data into the database

                    $redeem_code = date('Ymd').time().rand(111111,999999);
                $comp_name=session()->get('competition')[0];
                $comp_date=session()->get('competition')[1];
                $comp_id=CompetitionModel::where('title',$comp_name)->first();
                    $orders = new strip_order;
                    $orders->payer_id = $arr_body['id'];
                    $orders->user_id = Auth::user()->id;
                    $orders->price = 10;
                    $orders->status = $arr_body['state'];
                    $orders->redeem_code = $redeem_code;
                    $orders->payment_method = $arr_body['payer']['payment_method'];
                $orders->competition_name =$comp_name ;
                $orders->competition_date = $comp_date;
                $orders->url = $comp_id->id;
                    $orders->save();

                    // session()->put('redeem_code', $redeem_code);

                    session()->forget('competition');
                    return redirect(route('user_myredeem'))->with('added', 'Thank you for purchasing...');

            }
            else
            {
                return $response->getMessage();
            }
        } else {
//            return 'Transaction is declined';
            return back()->with('failed', 'Transaction is declined');
        }
    }

    /**
     * Error Handling.
     */
    public function error()
    {
        return 'User cancelled the payment.';
    }

}
