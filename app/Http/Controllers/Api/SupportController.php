<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Support;
use App\Models\Questions;
use App\Models\QueAnswer;
use App\Models\BarberService;
use App\Models\AdminInfo;
use App\Models\User;
use Validator;
use Auth;

class SupportController extends BaseController
{
    
    public function questions()
    {
        try
        {
            $questions = Questions::get();
            return response()->json(['success'=>true,'message' =>'Questions List','data'=>$questions]);
        }
        catch(\Eception $e){
            return $this->sendError($e->getMessage());

        }
    }
    
    public function question_answer(Request $request)
    {
        try
        {
            
            foreach($request->answers as $key => $service)
            {
                QueAnswer::create([
                    'user_id' => Auth::user()->id,
                    'question_id' => $service['id'],
                    'answer' => $service['answer'],
                ]);
            }
            
            $users = User::with('services','services.service_info','wallet','temporary_address')->find(Auth::user()->id);
            $totalQuestions = Questions::count();
            $answeredQuestions = QueAnswer::where('user_id',$users->id)->count();
            
            if ($answeredQuestions < $totalQuestions) {
                $users->complete_questions = 'No';
            } else {
                $users->complete_questions = 'Yes';//QueAnswer::where('user_id',$user->id)->get();
            }
            
            $service =  BarberService::where('user_id',Auth::user()->id)->where('main_service','1')->first();

            if($service->price < 51)
            {
                $users->tier = '$';   
            }
            else if($service->price > 50 && $service->price < 81)
            {
                $users->tier = '$$';   
            }
            else
            {
                $users->tier = '$$$';   
            }

            
            
            return response()->json(['success'=>true,'message' =>'Created Successfully','user_info'=>$users]);
        }
        catch(\Eception $e){
            return $this->sendError($e->getMessage());

        }
    }
    
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
