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
                'type' => 'required',
                'action' => 'required',
            ]);
            if($validator->fails())
            {
                return $this->sendError($validator->errors()->first());
            }

            if($request->action == 'remove')
            {
                if($request->type == 'barber')
                {
                    Wishlist::where('member_id' ,Auth::user()->id)->where('barber_id',$request->input('barber_id'))->delete();
                }
                else
                {
                    Wishlist::where('member_id' ,Auth::user()->id)->where('product_id',$request->input('product_id'))->delete();
                }
            }
            else{
                $data = Wishlist::create([
                    'member_id' => Auth::user()->id,
                    'barber_id'=> $request->input('barber_id'),
                    'product_id'=> $request->input('product_id'),
                    'type'=> $request->input('type'),
                ]);
            }


            return response()->json(['success'=>true,'message'=>'Your Wishlist has been Sent'], 200);

        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()], 500);
        }
    }
    public function wishlist_get(Request $request){
        if($request->type == 'barber')
        {
            $wishlist = Wishlist::with('barber_info')->where('type',$request->type)->where('member_id',Auth::user()->id)->get();
        }
        else
        {
            $wishlist = Wishlist::with('products')->where('type',$request->type)->where('member_id',Auth::user()->id)->get();
        }
        return response()->json(['success'=>true,'Wishlist_list'=> $wishlist],200);
    }
}

