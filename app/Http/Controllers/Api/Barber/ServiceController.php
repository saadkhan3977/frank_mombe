<?php

namespace App\Http\Controllers\Api\Barber;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use App\Models\Booking;
use App\Models\User;
use App\Models\Questions;
use App\Models\QueAnswer;
use App\Models\BarberService;
use Auth;
use Validator;

class ServiceController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $service = BarberService::with('service_info')->where('user_id',Auth::user()->id)->get();
        return $this->sendResponse($service,'Service Lists');
    }
    
    public function service_list()
    {
        $service = Service::get();
        return $this->sendResponse($service,'Service Lists');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        // return Auth::user()->id;
        // return $request->all();die;
        $validate = Validator::make($request->all(),[

            'service_name' => 'required',
            // 'price' => 'required',
            // 'price' => 'required',
        ]);

        if($validate->fails())
        {
		    return $this->sendError($validate->errors()->first());
        }
        BarberService::where('user_id',Auth::user()->id)->delete();
        
        foreach($request->service_name as $key => $service)
        {
            $mainservice = Service::find($service['service_id']);
            BarberService::create([
                'service_id' => $service['service_id'],
                'name' => $mainservice->name,
                'price' => $service['price'],
                'main_service' => $service['main_service'],
                'user_id' => Auth::user()->id,
            ]);
        }
        
        // $services = BarberService::with('service_info')->where('user_id',Auth::user()->id)->get();
        $users = User::with('services','services.service_info','wallet','temporary_address')->find(Auth::user()->id);
        $totalQuestions = Questions::count();
        $answeredQuestions = QueAnswer::where('user_id',$users->id)->count();
        
        if ($answeredQuestions < $totalQuestions) {
            $users->complete_questions = 'No';
        } else {
            $users->complete_questions = 'Yes';//QueAnswer::where('user_id',$user->id)->get();
        }

        return $this->sendResponse($users , 'Service Create Successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Service $service)
    {
        $input = $request->all();

        $validator = Validator::make($input, [
            'service_name' => 'required',
            'price' => 'required'
        ]);

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $service->service_name = $input['service_name'];
        $service->main_service = $input['main_service'];
        $service->price = $input['price'];
        $service->save();

        return $this->sendResponse($service, 'Service updated successfully.');
    }
    public function status_update(Request $request, $id)
    {
         $booking = Booking::find($id);
        $booking->update([
            'status' => $request->get('status'),
        ]);

        $bookings = Booking::find($id);
        return $this->sendResponse($bookings, 'Service updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Service $service)
    {
        $service->delete();

        return $this->sendResponse([], 'Service deleted successfully.');
    }

    public function barber_booking_list(Request $request)
    {
        // return $request->status ;die;
        if(isset($request->status))
        {
            $barberbooking = Booking::with('review','barber_info','booking_detail','booking_detail.service_info','member_info')->where('status',$request->status)->where('barber_id', Auth::user()->id)->get();
        }
        else
        {
            $barberbooking = Booking::with('review','barber_info','booking_detail','booking_detail.service_info','member_info')->where('barber_id', Auth::user()->id)->get();
        }
        return response()->json(['success'=>true,'barber_booking_list'=> $barberbooking],200);
    }
}
