<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Review;
use Illuminate\Http\Request;
use Auth;
use App\Models\User;


class ReviewController extends Controller
{
    public function review(Request $request)
    {
        try{
            $data = Review::create([
                'member_id' => Auth::user()->id,
                'booking_id' => $request->input('booking_id'),
                'rating' => $request->input('rating'),
                'description'=> $request->input('description'),
            ]);
            return response()->json(['success'=>true,'message'=>'Your review has been Sent']);
        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()]);
        }
    }
}
