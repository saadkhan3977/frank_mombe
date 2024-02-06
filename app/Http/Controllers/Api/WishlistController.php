<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Wishlist;
use App\Models\User;
use Auth;
use Validator;

class WishlistController extends Controller
{
    public function wishlist(Request $request)
    {
        try{
            $validator = Validator::make($request->all(), [
                'barber_id' => 'required',
            ]);
            if($validator->fails())
            {
                return $this->sendError($validator->errors()->first());
            }

            Wishlist::where('member_id' ,Auth::user()->id)->where('barber_id',$request->input('barber_id'))->delete();
            $data = Wishlist::create([
                'member_id' => Auth::user()->id,
                'barber_id'=> $request->input('barber_id'),
            ]);


            return response()->json(['success'=>true,'message'=>'Your Wishlist has been Sent'], 200);

        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()], 500);
        }
    }
    public function wishlist_get(){
        $wishlist = Wishlist::with('barber_info')->where('member_id',Auth::user()->id)->get();
        return response()->json(['success'=>true,'Wishlist_list'=> $wishlist],200);
    }
}

