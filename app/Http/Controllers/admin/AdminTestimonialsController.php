<?php

namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\Models\strip_order;

use Illuminate\Http\Request;

class AdminTestimonialsController extends Controller
{
    function order()
    {
        $order = strip_order ::with('order_with_user')->get();
        // dd($order);
        return view('admin.orders.order-list',compact('order'));
    }
    function testimonial_add()
    {
        return view('admin.testimonials.testimonials-add');
    }
    function testimonial_edit($id)
    {
        $testimonial = strip_order ::where('id',$id)->first();
        return view('admin.testimonials.testimonials-edit',compact('testimonial'));
    }
    function testimonial_delete(strip_order $testimonial)
    {
        $testimonial->delete();
        return back()->with('delete','Deleted Successfully');
    }
    function testimonial_add_edit_data(Request $request,strip_order $testimonial)
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
        $order = strip_order ::where('created_at','>=',$request->start_date)
            ->where('created_at','<=',$request->and_date,)->get();
        $price = strip_order ::where('created_at','>=',$request->start_date)
            ->where('created_at','<=',$request->and_date,)->sum('price');
//        dd($order);
        return view('admin.orders.order-list-filter',compact('order','price'));
    }

}
