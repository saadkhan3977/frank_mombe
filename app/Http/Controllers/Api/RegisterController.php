<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController as BaseController;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserTemporaryAddress;
use App\Models\Payment;
use App\Models\Goal;
use App\Models\Child;
use App\Models\TemporaryWallet;
use App\Models\Tranasaction;
use App\Models\Wallet;
use App\Models\BarberService;
use App\Models\Questions;
use App\Models\QueAnswer;
use Helper;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Mail\SendVerifyCode;
use Mail;
use Carbon\Carbon;
use Twilio\Rest\Client;
use Hash;
use Image;
use File;
use Stripe\Customer;



class RegisterController extends BaseController
{
    public function register(Request $request)
    {
		$validator = Validator::make($request->all(), [
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'designation' => 'required',
            'email' => 'required|email|unique:users',
            'phone' => 'required|numeric|unique:users',
            'password' => 'required|min:8',
            //'address' => 'required',
            'confirm_password' => 'required|same:password',
            'role' => 'required|string',
			'photo' => 'image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
        ]);
        if($validator->fails())
        {
		 return $this->sendError($validator->errors()->first());

        }
		
        $input = $request->except(['confirm_password'],$request->all());
        $input['password'] = bcrypt($input['password']);
		$input['email_verified_at'] = Carbon::now();
        $input['location'] = $request->address_name;
		$input['lat'] = $request->address_lat;
		$input['lng'] = $request->address_lng;

		//$input['email_code'] = mt_rand(9000, 9999);
        $profile = null;
        if($request->hasFile('photo'))
        {
            $file = request()->file('photo');
            $fileName = md5($file->getClientOriginalName() . time()) . $file->getClientOriginalExtension();
            $file->move('uploads/user/profiles/', $fileName);
            $profile = asset('uploads/user/profiles/'.$fileName);
        }
        $input['photo'] = $profile;

        $user = User::create([
            'password' => bcrypt($request->password),
            'email_verified_at' => Carbon::now(),
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'phone' => $request->phone,
            'designation' => $request->designation,
            'role' => $request->role,
            'photo' => $profile,
            'travel_mode' => 0,
            'holiday_mode' => 0,
            'rush_service' => 0,
            'location' => $request->address_name,
            'lat' => $request->address_lat,
            'lng' => $request->address_lng,
        ]);

        Wallet::create([
            'user_id' => $user->id,
            'amount' => 0
        ]);

        if($request->travel_mode == 1)
			{
				$temporaryAddress = UserTemporaryAddress::where('user_id','id',$user->id)->first();
				if($temporaryAddress)
				{
					$temporaryAddress->name = $request->temporary_address_name;
					$temporaryAddress->lat = $request->temporary_address_lat;
					$temporaryAddress->lng = $request->temporary_address_lng;
					$temporaryAddress->save();
				}
				else
				{
					UserTemporaryAddress::create([
						'user_id' => $user->id,
						'name' => $request->temporary_address_name,
						'lat' => $request->temporary_address_lat,
						'lng' => $request->temporary_address_lng,
					]);
				}
			}


//        Mail::to($user->email)->send(new SendVerifyCode($input['email_code']));
        $token =  $user->createToken('app_api')->plainTextToken;
		$users = User::with('services','wallet','temporary_address')->where('id',$user->id)->first();
		
		$totalQuestions = Questions::count();
        $answeredQuestions = QueAnswer::where('user_id',$users->id)->count();
        
        if ($answeredQuestions < $totalQuestions) {
            $users->complete_questions = 'No';
        } else {
            $users->complete_questions = 'Yes';//QueAnswer::where('user_id',$user->id)->get();
        }
        
        $service =  BarberService::where('user_id',$users->id)->where('main_service','1')->first();
        if($service)
        {
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
        }
        else
        {
            $users->tier = null;  
        }
            
            
		return response()->json(['success'=>true,'message'=>'User register successfully' ,'token'=>$token,'user_info'=>$users]);
    }

    public function login(Request $request)
    {
        if(!empty($request->email) || !empty($request->password))
        {
            $validator = Validator::make($request->all(), [
                'email' => 'required|email|exists:users',
                'password' => 'required',
            ]);
            if($validator->fails()){
				return $this->sendError($validator->errors()->first());
            }
            
            
            

            // if($user->email_verified_at != null)
            // {
                if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
                    $users = Auth::user();
                    $token =  $users->createToken('app_api')->plainTextToken;
            // `       $user = Helper::response();
            
            
                    $user = User::with('services','wallet','temporary_address')->find(Auth::user()->id);
                    $totalQuestions = Questions::count();
                    $answeredQuestions = QueAnswer::where('user_id',Auth::user()->id)->count();
                    if ($answeredQuestions < $totalQuestions) {
                        $user->complete_questions = 'No';
                    } else {
                        $user->complete_questions = 'Yes';//QueAnswer::where('user_id',Auth::user()->id)->get();
                        
                    }
                    $service =  BarberService::where('user_id',Auth::user()->id)->where('main_service','1')->first();
                    if($service)
                    {
                        if($service->price < 51)
                        {
                            $user->tier = '$';   
                        }
                        else if($service->price > 50 && $service->price < 81)
                        {
                            $user->tier = '$$';   
                        }
                        else
                        {
                            $user->tier = '$$$';   
                        }
                    }
                    else
                    {
                        $user->tier = null;  
                    }
		            return response()->json(['success'=>true,'message'=>'User Logged In successfully' ,'token'=>$token,'user_info'=>$user]);
               }
                else{
				return $this->sendError('Unauthorised User');

                }

        //     }else{
		// return $this->sendError('Email Not Verified , Check Email');

        //     }

        }else{
		return $this->sendError('Email & Password are Required');

        }

    }

    public function me()
    {
        $user = User::with(['child','goal','temporary_wallet','wallet','payments'])->where('id',Auth::user()->id)->first();
        return response()->json(['success'=>true,'message'=>'User Fetch successfully','user_info'=>$user]);
    }
    public function logout()
    {
        if(Auth::check())
        {
            $user = Auth::user()->token();
            $user->revoke();
            $success['success'] =true;
            return $this->sendResponse($success, 'User Logout successfully.');
        }else{
            return $this->sendError('No user in Session .');
        }
    }
    public function user(Request $request)
    {
        if(Auth::check())
        {
            $success['user_info'] = $request->user();
        return $this->sendResponse($success, 'Current user successfully.');
        }
        else{
            return $this->sendError('No user in Session .');
        }
    }
    public function verify(Request $request)
    {
		$validator = Validator::make($request->all(),['email_code'=>'required']);
        if($validator->fails()){
            return $this->sendError($validator->errors()->first());
            }
        $user = User::firstWhere('email_code',$request->email_code);
        if($user == null)
        {
            return $this->sendError('Token Expire or Invalid');
        }else{
            $user->update(['email_verified_at'=>Carbon::now(),'email_code'=>null]);
            $success['success'] =true;
            return $this->sendResponse($success, 'Email verified Successfully');
        }
    }
    public function change_password(Request $request)
    {
        try
        {
            $validator = Validator::make($request->all(),[
                'current_password' => 'required',
                'new_password' => 'required|same:confirm_password|min:8',
                'confirm_password' => 'required',
            ]);
            if($validator->fails()){
                return $this->sendError($validator->errors()->first());
                }
                $user = Auth::user();

            if (!Hash::check($request->current_password,$user->password)) {
                return $this->sendError(['error'=>'Current Password Not Matched']);
            }
            $user->password = Hash::make($request->new_password);
            $user->save();
            return response()->json(['success'=>true,'message'=>'Password Successfully Changed','user_info'=>$user]);
        }
        catch(\Eception $e){
           return $this->sendError($e->getMessage());
        }
    }

    public function noauth(){
	 return $this->sendError('session destroyed , Login to continue!');

	}



}
