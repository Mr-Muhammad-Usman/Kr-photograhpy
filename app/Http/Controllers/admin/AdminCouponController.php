<?php

namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\Models\CompetitionModel;
use App\Models\Coupon_detailModel;
use App\Models\CouponModel;
use App\Models\ordersModel;
use Illuminate\Http\Request;

class AdminCouponController extends Controller
{
    function Coupon_list()
    {
        $Coupon = CouponModel::with('couponWithComp')->where('soft_delete', null)->get();
//        dd($Coupon);
        return view('admin.Coupons.Coupon-list',compact('Coupon'));
    }
    function Coupon_add()
    {
        $competition=CompetitionModel::where('soft_delete', null)->get();
        return view('admin.Coupons.Coupon-add',compact('competition'));
    }
    function Coupon_edit($id)
    {
        $competition=CompetitionModel::get();
        $Coupon = CouponModel::where('id',$id)->first();
        $comp_value=CompetitionModel::where('id',$Coupon->competition_id)->first();
//        dd($comp_value);
        return view('admin.Coupons.Coupon-edit',compact('Coupon','competition','comp_value'));
    }
    function Coupon_delete(CouponModel $Coupon)
    {
//
            // dd('Deleted Successfully');
            $Coupon->delete();
            return back()->with('delete','Deleted Successfully');

    }
    function Coupon_add_edit_data(Request $request,CouponModel $Coupon)
    {
        $this->validate(
            $request,
            [
            'code'=>'required',
            'discount'=>'required|max:2',
            'quantity'=>'required',
            'competition'=>'required',
            ],
            [
                'discount.max'=>'Max discount is 99% ',
            ]
             );
//        dd($request);
        $create = 1;
        (isset($Coupon->id) and $Coupon->id>0)?$create=0:$create=1;
        // if($request->hasFile('images'))
        // {
        //     $imageName = time().'.'.$request->images->getClientOriginalExtension();
        //     $request->images->move(public_path('/uploads/Coupon'), $imageName);
        //     $Coupon->images = $imageName;
        // }
        $Coupon->code = $request->code;
        if ($request->discount == 0)
        {
            $Coupon->discount = 100;
        }
        else
        {
//            dd('hello');
            $Coupon->discount = $request->discount;
        }
        $Coupon->status = $request->status;
        $Coupon->quantity = $request->quantity;
        $Coupon->competition_id = $request->competition;
        $Coupon->save();
        if($create == 0)
        {
            return back()->with('update','Updated Successfully');
        }
        else
        {
            return back()->with('success','Added Successfully');
        }
    }
}
