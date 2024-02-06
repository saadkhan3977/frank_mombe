<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Api\BaseController as BaseController;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\ServiceTiming;
use App\Models\Service;
use App\Models\Notification;
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
        $user = User::where('role','barber');
        if($request->featured)
		{
			$user->where('featured',1);
		}
		if($request->earlier)
		{
			$user->where('rush_service',1);
		}
		$latitude = Auth::user()->lat;
		$longitude = Auth::user()->lng;
		$radius = 10;
		if($request->near)
		{
			$user->select('*')
			->selectRaw(
				'( 6371 * acos( cos( radians(?) ) *
				   cos( radians( lat ) )
				   * cos( radians( lng ) - radians(?)
				   ) + sin( radians(?) ) *
				   sin( radians( lat ) ) )
				 ) AS distance', [$latitude, $longitude, $latitude])
			->havingRaw("distance < ?", [$radius])
			->orderBy("distance", 'asc');
		}
		$users = $user->get();
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
        $user = User::with('services', 'review','review.customer_info', 'service_timing')->find($id);
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
			$olduser = User::where('id',Auth::user()->id)->first();
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
				return $this->sendError($validator->errors()->first());

			}
			$profile = $olduser->photo;


			if($request->hasFile('photo'))
			{
				$file = request()->file('photo');
				$fileName = md5($file->getClientOriginalName() . time()) . "PayMefirst." . $file->getClientOriginalExtension();
				$file->move('uploads/user/profiles/', $fileName);
				$profile = asset('uploads/user/profiles/'.$fileName);
			}
			$olduser->first_name = $request->first_name;
			$olduser->last_name = $request->last_name;
			$olduser->email = $request->email;
			$olduser->photo = $profile;
			$olduser->save();



			$user = User::find(Auth::user()->id);

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
