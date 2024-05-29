<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Models\Booking;
use App\Models\User;
use App\Models\Wallet;
use App\Http\Controllers\Controller;
use App\Models\BookingDetail;
use App\Models\Tranasaction;
use Illuminate\Http\Request;
use Validator;
use Auth;
use Stripe;


class BookingController extends BaseController
{

    // public function filter_service(Request $request)
    // {
    //     try
    //     {

    //         $booking = Booking::where(['barber_id'=>$request->barber_id,'booking_date'=>$request->date,'booking_time'=> $request->time,'status'=>'accept'])->get();
    //         if($booking)
    //         {
    //           return ServiceTiming::with(['booking' => function ($query) use ($request) {
    //                 $query->where('booking_time', $request->time);
    //             }])->find($request->barber_id);
    //             //User::find($request->barber_id)->join('')

    //         }
    //         return User::with('available_service_timing')->find($request->barber_id);


    //         // Booking::where('barber_id',$request->barber_id)->whereDate('created_at', $request->date)->get();
    //     }
    //     catch(\Exception $e)
    //     {
    //         return response()->json(['success'=>false,'message'=>$e->getMessage()]);
    //     }
    // }
    public function booking(Request $request)
    {
        // print_r($request->all());die;
        try{
            $validator = Validator::make($request->all(), [
                'booking_time' => 'required',
                'booking_date'=> 'required',
            ]);
            if($validator->fails())
            {
                return $this->sendError($validator->errors()->first(),500);
            }
            $fileName = [];
            $profile= '';
            if($request->hasFile('image'))
			{
				$file = request()->file('image');
				$fileName = md5($file->getClientOriginalName() . time()) . "PayMefirst." . $file->getClientOriginalExtension();
				$file->move('uploads/bookings/', $fileName);
				$profile = asset('uploads/bookings/'.$fileName);
			}

            // $input = $request->except(['_token'],$request->all());

            $total = $request->input('price') - $request->input('dis_price');
            
            if($request->payment_method == 'stripe')
            {
                Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

                Stripe\Charge::create ([
                        "amount" => $request->price * 100,
                        "currency" => "usd",
                        "source" => $request->stripeToken,
                        "description" => "Test payment from Frank Mombe Application"
                ]);
                
                $data = Tranasaction::create([
                        'user_id' => Auth::user()->id,
                        'amount' => $total,
                        //'date' => $request->date,
                        'reason' => 'for barber booking',
                        'type' => 'debit',
                        //'pm_id' => $customer->id,
                        //'status' => 'Pending',
                    ]);

    
                    $data = Booking::create([
                        'member_id' => Auth::user()->id,
                        'barber_id' => $request->input('barber_id'),
                        'service_time_id' => $request->input('service_time_id'),
                        'booking_time' => $request->input('booking_time'),
                        'booking_date'=> $request->input('booking_date'),
                        'price'=> $request->input('price'),
                        'dis_price'=> $request->input('dis_price'),
                        'total_price' => $total,
                        'image' => $profile,
                        'custom_location'=> $request->input('custom_location'),
                        'status' => 'pending',
                    ]);
        
                    foreach($request->service_id as $service)
                    {
                        BookingDetail::create([
                            'booking_id' => $data->id,
                            'service_id' => $service,
                        ]);
                    }
                    $user = User::with('wallet','temporary_address')->find(Auth::user()->id);
                    return response()->json(['success'=>true,'message'=>'Your Booking has been Sent','user_info'=>$user]);
            }
            if($request->payment_method == 'wallet')
            {
                $wallet = Wallet::where('user_id',Auth::user()->id)->first();
                if($wallet->amount < $total)
                {
                    return response()->json(['success'=>false,'message'=>'Insufficient credits please buy some & order again']);
                }
                else
                {
                    $data = Tranasaction::create([
                        'user_id' => Auth::user()->id,
                        'amount' => $total,
                        //'date' => $request->date,
                        'reason' => 'for barber booking',
                        'type' => 'debit',
                        //'pm_id' => $customer->id,
                        //'status' => 'Pending',
                    ]);
    
                    $wallet->amount = $wallet->amount - $total;
                    $wallet->save();
    
                    $data = Booking::create([
                        'member_id' => Auth::user()->id,
                        'barber_id' => $request->input('barber_id'),
                        'service_time_id' => $request->input('service_time_id'),
                        'booking_time' => $request->input('booking_time'),
                        'booking_date'=> $request->input('booking_date'),
                        'price'=> $request->input('price'),
                        'dis_price'=> $request->input('dis_price'),
                        'total_price' => $total,
                        'image' => $profile,
                        'custom_location'=> $request->input('custom_location'),
                        'status' => 'pending',
                    ]);
        
                    foreach($request->service_id as $service)
                    {
                        BookingDetail::create([
                            'booking_id' => $data->id,
                            'service_id' => $service,
                        ]);
                    }
                    $user = User::with('wallet','temporary_address')->find(Auth::user()->id);
                    return response()->json(['success'=>true,'message'=>'Your Booking has been Sent','user_info'=>$user]);
                }
            }

        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()]);
        }
    }
    //public function barber_booking_list()
    //{
    //    $data = Booking::with('booking_detail', 'booking_detail.service_info','member_info')->where('barber_id',Auth::user()->id)->get();
    //    return $this->sendResponse($data,'barber Booking List');
    //}
    
	public function booking_list(Request $request)
    {
        if($request->status != 'all')
        {
            $data = Booking::with('review','barber_info','booking_detail','booking_detail.service_info','member_info')->where('status',$request->status)->where('member_id', Auth::user()->id)->get();
        }
        else
        {
            $data = Booking::with('review','barber_info','booking_detail', 'booking_detail.service_info','member_info')->where('member_id',Auth::user()->id)->get();
        }
        return $this->sendResponse($data,'Booking List');
    }
}
