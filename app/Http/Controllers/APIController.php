<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;

class APIController extends Controller
{
    public function getUser()
    {
        $user=User::all();

        if (count($user) > 0)
        {
            return response()->json([
                'data'=>$user,
                'success'=>true,
                'message'=>'All data get',
        ]);
        }
        else
        {
            return response()->json([
                'success'=>false,
                'message'=>'There is some error for All data get',
            ]);
        }

    }
    public function addUser(Request $request)
    {
        $rules = array(
            'username' => ['required', 'string'],
            'email' => ['required'],
        );
        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return $validator->errors();
        }
        $user=new User();
        $user->username=$request->username;
        $user->email=$request->email;
        $user->save();
        if ($user->save())
        {
            return response()->json([
                'data'=>$user,
                'success'=>true,
                'message'=>'data save',
        ]);
        }
        else
        {
            return response()->json([
                'success'=>false,
                'message'=>'data not save',
            ]);
        }

    }
    public function updateUser(Request $request,$id)
    {
        $user=User::where('id',$id)->first();
        $user->username=$request->username;
        $user->email=$request->email;
        $user->save();
        if ($user->save())
        {
            return response()->json([
                'data'=>$user,
                'success'=>true,
                'message'=>'data update',
            ]);
        }
        else
        {
            return response()->json([
                'success'=>false,
                'message'=>'data not update',
            ]);
        }

    }

    public function deleteUser($id)
    {
        $user=User::where('id',$id)->delete();

        if ($user > 0)
        {
            return response()->json([
                'success'=>true,
                'status'=>200,
                'message'=>'data delete',
            ]);
        }
        else
        {
            return response()->json([
                'success'=>false,
                'status'=>400,
                'message'=>'data not exist',
            ]);
        }

    }
}
