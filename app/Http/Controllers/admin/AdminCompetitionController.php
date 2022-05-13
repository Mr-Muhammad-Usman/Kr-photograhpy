<?php

namespace App\Http\Controllers\admin;
use App\Http\Controllers\Controller;
use App\Models\CompetitionModel;
use App\Models\strip_order;
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
    function Competition_delete(CompetitionModel $Competition)
    {
        // dd($Competition->title);
        $check=strip_order::where('competition_name',$Competition->title)->first();
        if($check)
        {
            // dd('Can not Delet');
            return back()->with('delete','You cannot delete this. this is already linked with Competition.');
        }
        else
        {
            // dd('Deleted Successfully');
            $Competition->delete();
            return back()->with('delete','Deleted Successfully');
        }

    }
    function Competition_add_edit_data(Request $request,CompetitionModel $Competition)
    {
        $create = 1;
        (isset($Competition->id) and $Competition->id>0)?$create=0:$create=1;
        // if($request->hasFile('images'))
        // {
        //     $imageName = time().'.'.$request->images->getClientOriginalExtension();
        //     $request->images->move(public_path('/uploads/Competition'), $imageName);
        //     $Competition->images = $imageName;
        // }
        $Competition->title = $request->title;
        // $Competition->description = $request->description;
        // $Competition->author = Auth()->user()->id;
        $Competition->status = $request->status;
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
