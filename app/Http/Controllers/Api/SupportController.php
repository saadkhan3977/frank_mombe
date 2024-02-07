<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Support;
use App\Models\AdminInfo;
use Validator;
use Auth;
class SupportController extends BaseController
{
    public function support(Request $request)
    {

        try{
            $validator = Validator::make($request->all(), [
             //   'job_id' => 'required',
                'name' => 'required|string',
                'phone' => 'required|numeric',
                'email' =>'required|email',
                'subject'=>'required|string',
                'description'=>'required|string'
            ]);
            if($validator->fails())
            {
                return $this->sendError($validator->errors()->first());
            }
            $input = $request->except(['_token'],$request->all());
            $data = Support::create([
                'user_id' => Auth::user()->id,
                'job_id' => $request->input('job_id'),
                'name' => $request->input('name'),
                'phone'=> $request->input('phone'),
                'email'=> $request->input('email'),
                'subject'=> $request->input('subject'),
                'description'=> $request->input('description'),
            ]);
            return response()->json(['success'=>true,'message'=>'Your Request has been Sent','data'=>$data]);

        }
        catch(\Eception $e){
            return $this->sendError($e->getMessage());

        }

    }
    public function admininfo()
    {

        try{
            $admin =AdminInfo::first();
            return response()->json(['success'=>true,'data'=>$admin]);

        }catch(\Eception $e){
            return $this->sendError($e->getMessage());

        }
    }
}
