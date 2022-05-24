<?php

namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\Models\Coupon_detailModel;
use App\Models\CouponModel;
use App\Models\ordersModel;
use Illuminate\Http\Request;

class AdminCouponController extends Controller
{
    function Coupon_list()
    {
        $Coupon = CouponModel::get();
//        dd($Coupon);
        return view('admin.Coupons.Coupon-list',compact('Coupon'));
    }
    function Coupon_add()
    {
        return view('admin.Coupons.Coupon-add');
    }
    function Coupon_edit($id)
    {
        $Coupon = CouponModel::where('id',$id)->first();
        return view('admin.Coupons.Coupon-edit',compact('Coupon'));
    }
    function Coupon_delete(CouponModel $Coupon)
    {
//         dd($Coupon);
        $check=Coupon_detailModel::where('coupon_id',$Coupon->id)->first();
        if($check)
        {
            // dd('Can not Delet');
            return back()->with('delete','You cannot delete this. this is already linked with Coupon.');
        }
        else
        {
            // dd('Deleted Successfully');
            $Coupon->delete();
            return back()->with('delete','Deleted Successfully');
        }

    }
    function Coupon_add_edit_data(Request $request,CouponModel $Coupon)
    {
//        dd($request);
        $request->validate([
            'code'=>'required',
            'discount'=>'required',
            'quantity'=>'required',
        ]);
        $create = 1;
        (isset($Coupon->id) and $Coupon->id>0)?$create=0:$create=1;
        // if($request->hasFile('images'))
        // {
        //     $imageName = time().'.'.$request->images->getClientOriginalExtension();
        //     $request->images->move(public_path('/uploads/Coupon'), $imageName);
        //     $Coupon->images = $imageName;
        // }
        $Coupon->code = $request->code;
        $Coupon->discount = $request->discount;
        $Coupon->status = $request->status;
        $Coupon->quantity = $request->quantity;
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
