<?php

namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\Models\OrdersModel;

use Illuminate\Http\Request;

class AdminOrderController extends Controller
{
    function order()
    {
        $order = OrdersModel ::with('order_with_user','order_with_comp')->get();
        // dd($order);
        return view('admin.orders.order-list',compact('order'));
    }
    function testimonial_add()
    {
        return view('admin.testimonials.testimonials-add');
    }
    function testimonial_edit($id)
    {
        $testimonial = OrdersModel ::where('id',$id)->first();
        return view('admin.testimonials.testimonials-edit',compact('testimonial'));
    }
    function testimonial_delete(OrdersModel $testimonial)
    {
        $testimonial->delete();
        return back()->with('delete','Deleted Successfully');
    }
    function testimonial_add_edit_data(Request $request, OrdersModel $testimonial)
    {
        $create = 1;
        (isset($testimonial->id) and $testimonial->id>0)?$create=0:$create=1;
        if($request->hasFile('images'))
        {
            $imageName = time().'.'.$request->images->getClientOriginalExtension();
            $request->images->move(public_path('/uploads/testimonials'), $imageName);
            $testimonial->images = $imageName;
        }
        $testimonial->description = $request->description;
        $testimonial->name = $request->name;
        $testimonial->designation = $request->designation;
        $testimonial->status = $request->status;
        $testimonial->save();
        if($create == 0)
        {
            return back()->with('update','Updated Successfully');
        }
        else
        {
            return back()->with('success','Added Successfully');
        }
    }
    function order_filter(Request $request)
    {
//        dd($request);
        $order = OrdersModel::where('created_at','>=',$request->start_date)
            ->where('created_at','<=',$request->and_date,)->get();
        $price = OrdersModel::where('created_at','>=',$request->start_date)
            ->where('created_at','<=',$request->and_date,)->sum('price');
//        dd($order);
        return view('admin.orders.order-list-filter',compact('order','price'));
    }

}
