<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\User;
use App\Models\Wallet;

class OrdersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct()
    {
        $stripe = \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
    }

    public function index()
    {
        $order = Order::orderBy('id','DESC')->paginate();
        return view('admin.order.index')->with('orders',$order);
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request,Order $order)
    {
        if(request('status') == 'ongoing')
        {
            $user = User::find($order->user_id);
            if($order->payment_method == 'wallet')
            {
                $wallet = Wallet::where('user_id',Auth::user()->id)->first();

                $wallet->amount = $wallet->amount - $order->total_amount;
                $wallet->save(); 
                $order->payment_status = 'paid';
                // $order->status = $request->status;
                // $order->save();
            }
            else{

                \Stripe\Charge::create([
                    'amount' => $order->total_amount*100,
                    'currency' => 'usd',
                    'customer' => $user->stripe_id
                ]);
                $order->payment_status = 'paid';
                $order->status = 'ongoing';
            }
        }
        $order->status = request('status');
        $order->save();
        return redirect()->back()->with(['success'=>'order update successfully']);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
