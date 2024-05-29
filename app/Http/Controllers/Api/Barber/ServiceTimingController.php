<?php

namespace App\Http\Controllers\Api\Barber;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Models\ServiceTiming;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Auth;

class ServiceTimingController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

     public function service_timing_list(){
        $serviceTiming = User::with('time')->find( Auth::user()->id);

        // $serviceTiming = ServiceTiming::where('barber_id', Auth::user()->id)->get();
        return response()->json(['success'=>true,'info'=> $serviceTiming],200);
    }
    public function service_timing(Request $request)
    {
        try{
            $validator = Validator::make($request->all(), [
                'time' => 'required',
            ]);
            if($validator->fails())
            {
                return $this->sendError($validator->errors()->first());
            }
            ServiceTiming::whereNotNull('id')->where('barber_id', Auth::user()->id)->delete();
            foreach($request->time as $key => $serviceTiming)
        {
            $data =  ServiceTiming::create([
                'barber_id' => Auth::user()->id,
                'time' => $serviceTiming,
                'status' => 'available',

            ]);
        }

            return response()->json(['success'=>true,'message'=>'Your Timing has been Sent', 200]);

        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()], 500);
        }
    }
    // public function service_list(){
    //     $serviceTiming = ServiceTiming::where('barber_id', Auth::user()->id)->get();
    //     return response()->json(['success'=>true,'service timing'=> $serviceTiming],200);
    // }


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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ServiceTiming  $serviceTiming
     * @return \Illuminate\Http\Response
     */
    public function show(ServiceTiming $serviceTiming)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ServiceTiming  $serviceTiming
     * @return \Illuminate\Http\Response
     */
    public function edit(ServiceTiming $serviceTiming)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ServiceTiming  $serviceTiming
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ServiceTiming $serviceTiming)
    {

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ServiceTiming  $serviceTiming
     * @return \Illuminate\Http\Response
     */
    public function destroy(ServiceTiming $serviceTiming)
    {
        $serviceTiming->delete();

        return $this->sendResponse([], 'Service Timing deleted successfully.');
    }
}
