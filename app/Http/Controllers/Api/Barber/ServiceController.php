<?php

namespace App\Http\Controllers\Api\Barber;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Service;
use App\Models\Booking;
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
        $service = Service::where('user_id',Auth::user()->id)->get();
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
        //return $request->all();
        $validate = Validator::make($request->all(),[

            'service_name' => 'required',
            // 'price' => 'required',
        ]);

        if($validate->fails())
        {
		    return $this->sendError($validate->errors()->first());
        }
        Service::whereNotNull('id')->where('user_id', Auth::user()->id)->delete();
        foreach($request->service_name as $key => $service)
        {
            Service::create([
                'name' => $service['name'],
                'price' => $service['price'],
                'user_id' => Auth::user()->id,
            ]);
        }

        return $this->sendResponse($service , 'Service Create Successfully');
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
        if($request->status != 'all')
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
