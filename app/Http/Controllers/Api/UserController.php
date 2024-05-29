<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Api\BaseController as BaseController;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserTemporaryAddress;
use App\Models\ServiceTiming;
use App\Models\Service;
use App\Models\Notification;
use App\Models\Questions;
use App\Models\BarberService;
use App\Models\QueAnswer;
use App\Models\AdminInfo;
use Image;
use File;
use Auth;
use Validator;
class UserController extends BaseController
{
	public function __construct()
    {
		$stripe = \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
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

	// public function un_reead_notification()
	// {
	// 	$notification = Auth::user()->unreadNotifications;
	// 	$notificationold = Auth::user()->readNotifications;
	// 	$unread = count(Auth::user()->unreadNotifications);
	// 	$read = count(Auth::user()->readNotifications);
	// 	// return $notification[0]->data['title'];
	// 	$data = null;
	// 	if($notification)
	// 	{
	// 		foreach($notification as $row)
	// 		{
	// 			$data[] = [
	// 				'id' => $row->id,
	// 				'title' => $row->data['title'],
	// 				'description' => $row->data['description'],
	// 				'created_at' => $row->data['time'],
	// 				'status' => 'unread'
	// 			];
	// 			// $data[] = $row->data;
	// 		}
	// 	}

	// 	$olddata = null;
	// 	if($notificationold){

	// 		foreach($notificationold as $row)
	// 		{
	// 			$data[] = [
	// 				'id' => $row->id,
	// 				'title' => $row->data['title'],
	// 				'description' => $row->data['description'],
	// 				'read_at' => $row->data['time'],
	// 				'status' => 'read'
	// 			];
	// 		}
	// 	}
	// 	return response()->json(['success'=>true,'unread'=> $unread,'read'=> $read,'notification' => $data]);
	// }

    public function barber_list(){
        $users = User::where('role','barber')->get();
        return response()->json(['success'=>true,'users'=> $users],200);
    }
	
	public function barber_filter(Request $request)
	{
		
        $user = User::with('services.service_info','wallet','temporary_address')
        ->where('role','barber');
        if($request->featured)
		{
			$user->where('featured',1);
		}
		if($request->earlier)
		{
			$user->where('rush_service',1);
		}
		
		
		
        // $service =  BarberService::where('user_id',Auth::user()->id)->where('main_service','1')->first();
        // if($service)
        // {
        //     if($service->price < 51)
        //     {
        //         $user->tier = '$';   
        //     }
        //     else if($service->price > 50 && $service->price < 81)
        //     {
        //         $user->tier = '$$';   
        //     }
        //     else
        //     {
        //         $user->tier = '$$$';   
        //     }
        // }
        // else
        // {
        //     $user->tier = null;  
        // }
        
		$latitude = Auth::user()->lat;
		$longitude = Auth::user()->lng;
		$radius = 20;
		if($request->near)
		{
			$radius = 10;
		}
		
		$user->select('users.*', 'b.lat as blat', 'b.lng as blng',
		\DB::raw("
		 CASE
	  	  WHEN  c.main_service = 1 AND c.price < 51 
	  	  THEN '$'
	  	  WHEN  c.main_service = 1 AND c.price > 50 AND c.price < 81
	  	  THEN '$$'
	  	  WHEN  c.main_service = 1 AND c.price > 80 
	  	  THEN '$$$'
	  	  ELSE 'NULL' END as tier  
		")
		)
		->selectRaw("
			CASE 
				WHEN travel_mode = 0 THEN
					(6371 * acos( cos( radians(?) ) *
						cos( radians( users.lat ) ) *
						cos( radians( users.lng ) - radians(?)
						) + sin( radians(?) ) *
						sin( radians( users.lat ) ) )
					)
				WHEN travel_mode = 1 THEN 
					(6371 * acos( cos( radians(?) ) *
						cos( radians( b.lat ) ) *
						cos( radians( b.lng ) - radians(?)
						) + sin( radians(?) ) *
						sin( radians( b.lat ) ) )
					)  
				ELSE 0
			END as distance
		", [$latitude, $longitude, $latitude, $latitude, $longitude, $latitude])
		->havingRaw("distance < ?", [$radius])
		->leftJoin("user_temporary_address as b", "users.id", "=", "b.user_id")
		->leftJoin("barber_services as c", "users.id", "=", "c.user_id")
		->where("c.main_service",1)
		->orderBy("distance", 'asc')
		->get();

		$users = $user->withCount('reviews')->withAvg('reviews', 'rating')->get();
		
		return response()->json(['success'=>true,'users'=> $users],200);
    }
	
	public function near_barber_featured_list()
	{
		$latitude = Auth::user()->lat; // Example latitude
		$longitude = Auth::user()->lng; // Example longitude
		$radius = 10; // Radius in kilometers

		$users = User::select('*')
			->selectRaw(
				'( 6371 * acos( cos( radians(?) ) *
				   cos( radians( latitude ) )
				   * cos( radians( longitude ) - radians(?)
				   ) + sin( radians(?) ) *
				   sin( radians( latitude ) ) )
				 ) AS distance', [$latitude, $longitude, $latitude])
			->havingRaw("distance < ?", [$radius])
			->orderBy("distance", 'asc')
			->where('role','barber')
			->where('featured',1)
			->get();	
		
		
        //$users = User::where('role','barber')->where('featured',1)->get();
        return response()->json(['success'=>true,'users'=> $users],200);
    }

    public function barber_detail($id)
    {
        $user = User::with('services', 'review','review.member_info', 'service_timing')->find($id);
        $totalQuestions = Questions::count();
        $answeredQuestions = QueAnswer::where('user_id',Auth::user()->id)->count();
        //if ($answeredQuestions < $totalQuestions) 
        //{
        //    $user->complete_questions = 'No';
        //} else {
        //    $user->complete_questions = 'Yes';//QueAnswer::where('user_id',Auth::user()->id)->get();
        //   $user->questions_ans =  QueAnswer::with('question')->where('user_id',$id)->get();
          $user->questions_ans =  Questions::with('answer')->get();
        //}
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
        return response()->json(['success'=>true,'message'=> 'Barber detail','user_detail'=> $user],200);
    }


    public function barber_available_services(Request $request,$id)
    {
        $date = $request->date;
        $user = ServiceTiming::with(['booking' => function ($query) use ($date) {
            $query->whereDate('booking_date', '=', $date);
        }])->where('barber_id',$id)->get();
        // $user = ServiceTiming::where('service_timings.barber_id',$id)
        // ->leftJoin('bookings', 'service_timings.barber_id', '=', 'bookings.barber_id')
        // ->select('service_timings.*','bookings.booking_date','bookings.status as booking_status')
        // ->whereDate('bookings.booking_date', '=', $request->date)
        // ->get();
    // $user = User::leftJoin('bookings', 'users.id', '=', 'bookings.barber_id')
        // ->select('users.*', 'bookings.booking_date','bookings.status as booking_status')
        // ->whereDate('bookings.booking_date', '=', $request->date)
        // ->find($id);
        return response()->json(['success'=>true,'message'=> 'Barber Booking Service','user_detail'=> $user],200);
    }

	// public function read_notification(Request $request)
	// {
	// 	try{
	// 		$validator = Validator::make($request->all(),[
	// 			'notification_id' => 'required',
	// 		]);
	// 		if($validator->fails())
	// 		{

	// 			return response()->json(['success'=>false,'message'=> $validator->errors()->first()]);
	// 		}

	// 		$notification= Notification::find($request->notification_id);
	// 		if($notification){
	// 			$notification->read_at = date(now());
	// 			$notification->save();
	// 			$status= $notification;
	// 			if($status)
	// 			{
	// 				return response()->json(['success'=>true,'message'=> 'Notification successfully deleted']);
	// 			}
	// 			else
	// 			{
	// 				return response()->json(['success'=>false,'message'=> 'Error please try again']);
	// 			}
	// 		}
	// 		else
	// 		{
	// 			return response()->json(['success'=>false,'message'=> 'Notification not found']);
	// 		}
	// 	}
	// 	catch(\Eception $e)
	// 	{
	// 		return response()->json(['error'=>$e->getMessage()]);
	//    	}
	// }

    public function profile(Request $request)
    {
        try{
			$olduser = User::find(Auth::user()->id);
			$validator = Validator::make($request->all(),[
				'first_name' =>'string',
				'last_name' =>'string',
				'passcode' => 'numeric',
				'phone' =>'numeric',
				'email' => 'email|unique:users,email,'.$olduser->id,
				'photo' => 'image|mimes:jpeg,png,jpg,bmp,gif,svg|max:2048',
			]);
			if($validator->fails())
			{
				return $this->sendError($validator->errors()->first(),500);

			}
			// print_r($request->all());die;
			// $request->address['lat'];
			$olduser->first_name = $request->first_name;
			$olduser->last_name = $request->last_name;
			$olduser->travel_mode = $request->travel_mode;
			$olduser->holiday_mode = $request->holiday_mode;
			$olduser->rush_service = $request->rush_service;
			$olduser['location'] = $request->address_name;
			$olduser['lat'] = $request->address_lat;
			$olduser['lng'] = $request->address_lng;
			$olduser->travel_date_from = $request->travel_date_from;
			$olduser->travel_date_to = $request->travel_date_to;

			$profile = $olduser->photo;
			if($request->hasFile('photo'))
			{
				$file = request()->file('photo');
				$fileName = md5($file->getClientOriginalName() . time()) . "PayMefirst." . $file->getClientOriginalExtension();
				$file->move('uploads/user/profiles/', $fileName);
				$profile = asset('uploads/user/profiles/'.$fileName);
			}
			$olduser->photo = $profile;


			
// 			print_r($request->all());die;
            $olduser->save();
			if($request->travel_mode == 1)
			{

				$temporaryAddress = UserTemporaryAddress::where('user_id','id',Auth::user()->id)->first();
				if($temporaryAddress)
				{
					$temporaryAddress->name = $request->temporary_address_name;
					$temporaryAddress->lat = $request->temporary_address_lat;
					$temporaryAddress->lng = $request->temporary_address_lng;
					$temporaryAddress->update();
				}
				else
				{
					UserTemporaryAddress::create([
						'user_id' => Auth::user()->id,
						'name' => $request->temporary_address_name,
						'lat' => $request->temporary_address_lat,
						'lng' => $request->temporary_address_lng,
					]);
				}
				$user = User::with('services','services.service_info','wallet','temporary_address')->find(Auth::user()->id);
			}
			if($request->travel_mode == 0)
			{
			    
				
				$temporaryAddress = UserTemporaryAddress::where('user_id',Auth::user()->id)->first();
				if($temporaryAddress)
				{
				    \DB::table('user_temporary_address')->where('user_id', '=', Auth::user()->id)->delete();

				    //$temporaryAddress->delete();
//				    return $temporaryAddress;
				}
				//$user = User::find(Auth::user()->id);
				$user = User::with('services','services.service_info','wallet','temporary_address')->find(Auth::user()->id);
			}

            

			return response()->json(['success'=>true,'message'=>'Profile Updated Successfully','user_info'=>$user]);
		}
		catch(\Eception $e)
		{
			return $this->sendError($e->getMessage());
		}

    }
	// public function current_plan(Request $request)
	// {
	// 	try{
	// 	//$user= User::findOrFail(Auth::id());
	// 	$user = User::with(['goal','temporary_wallet','wallet','payments'])->where('id',Auth::user()->id)->first();

	// 	$amount = 100;
	// 	$charge = \Stripe\Charge::create([
	// 		'amount' => $amount,
	// 		'currency' => 'usd',
	// 		'customer' => $user->stripe_id,
	// 	]);
	// 	if($request->current_plan == 'basic')
	// 	{
	// 		$user->update(['current_plan' =>"premium",'card_change_limit'=>'1','created_plan'=> \Carbon\Carbon::now()]);
	// 		return response()->json(['success'=>true,'message'=>'Current Plan Updated Successfully','user_info'=>$user,'payment' => $charge]);

	// 	}
	// 	elseif($request->current_plan == 'premium')
	// 	{
	// 		$user->update(['current_plan' =>"basic",'card_change_limit'=>'0','created_plan'=> \Carbon\Carbon::now()]);

	// 	 return response()->json(['success'=>true,'message'=>'Current Plan Updated Successfully','user_info'=>$user]);
	// 	}
	// 	else
	// 	{
	// 		return $this->sendError("Invalid Body ");
	// 	}
	// 	}
	// 	catch(\Exception $e){
	//   return $this->sendError($e->getMessage());

	// 	}

	// }


}
