<?php

namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\Models\CompetitionModel;
use App\Models\CouponModel;
use App\Models\ordersModel;
use Illuminate\Http\Request;

class AdminCompetitionController extends Controller
{
    function Competition_list()
    {
        $Competition = CompetitionModel::get();
        return view('admin.Competitions.Competition-list',compact('Competition'));
    }
    function Competition_add()
    {
        return view('admin.Competitions.Competition-add');
    }
    function Competition_edit($id)
    {
        $Competition = CompetitionModel::where('id',$id)->first();
        return view('admin.Competitions.Competition-edit',compact('Competition'));
    }
    function Competition_delete(Request $req)
    {
//         dd($req->all());
        $check=CompetitionModel::where('id',$req->id)->first();
        if($check)
        {
            $coupon=CouponModel::where('competition_id',$req->id)->get();
            foreach ($coupon as $item)
            {
                $item->delete();
            }
//            dd($coupon->all());
        }
        $check->delete();
        return response()->json([
            'status' => 1,
        ]);
    }
    function Competition_add_edit_data(Request $request,CompetitionModel $Competition)
    {
        $request->validate([
            'title'=>'required',
            'comp_date'=>'required',
            'comp_amount'=>'required',

        ]);

        $create = 1;
        (isset($Competition->id) and $Competition->id>0)?$create=0:$create=1;
        // if($request->hasFile('images'))
        // {
        //     $imageName = time().'.'.$request->images->getClientOriginalExtension();
        //     $request->images->move(public_path('/uploads/Competition'), $imageName);
        //     $Competition->images = $imageName;
        // }
        $Competition->title = $request->title;
        $Competition->url = $request->url;
        $Competition->competition_date = $request->comp_date;
        $Competition->status = $request->status;
        $Competition->amount = $request->comp_amount;
        $Competition->save();
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
