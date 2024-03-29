<?php

namespace App\Http\Controllers;

use App\Models\Tranasaction;
use Illuminate\Http\Request;
use Auth;
use Validator;
use App\Models\Wallet;
use App\Models\User;
use App\Models\Notification;
use App\Notifications\StatusNotification;

class TranasactionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
          $stripe = \Stripe\Stripe::setApiKey('sk_test_51McSueJ0WRwehn2UZwDPQaV7mNHj4b8bdMfWssO93HRWB5vpTF1dPFYIouVeMoa150GJaxr3rlVbWwvXxQpBPV0300AgtRq74g');
    }

    public function index()
    {
        try 
        {     
            $data = Tranasaction::where('user_id',Auth::user()->id)->paginate(10);
            
            return response()->json(['success'=>true,'date'=> $data]);
            
        } catch (\Stripe\Error\Card $e) {
            return response()->json(['error' => $e->getMessage()]);
        }
    }
    
    public function transaction_list()
    {
        try 
        {     
            $data['transaction'] = Tranasaction::get();
            
            return view('admin.transaction',$data);
            
        } 
        catch (\Stripe\Error\Card $e) 
        {
            return response()->json(['error' => $e->getMessage()]);
        }
    }
    
    public function transaction_status($id)
    {
        try 
        {     
            $tranasaction = Tranasaction::find($id);
            $wallet = Wallet::where('user_id',$tranasaction->user_id)->first();
            $pending =  $wallet->pending_amount - $tranasaction->amount; 
            $withdraw = $wallet->withdraw + $tranasaction->amount; 
            $amount = $wallet->amount - $tranasaction->amount;
            // echo $pending;
            // echo "<pre>";
            // echo $withdraw;
            // die;
            $tranasaction->status = request('status');
            $tranasaction->save();
            
            $wallet->pending_amount = $pending;
            $wallet->amount = $amount;
            $wallet->withdraw = $withdraw;
            $wallet->save();

            $users = User::find($tranasaction->user_id);
            $details=[
                'title'=>'Admin',
                'description'=>'Transaction Approved',
            ];
            \Notification::send($users, new StatusNotification($details));

            return redirect()->back()->with(['success'=>'Transaction Approved Successfull']);
            
        } 
        catch (\Stripe\Error\Card $e) 
        {
            return response()->json(['error' => $e->getMessage()]);
        }
    }
	
	public function buy_credits(Request $request,Order $order)
    {
		$credits = $request->credits;
		$amount = $request->input('credits') * 100;
		$email = Auth::user()->email;

		$customer = \Stripe\Customer::create([
			'email' => $email,
			'source' => $request->input('stripeToken'),
		]);

		$charge = \Stripe\Charge::create([
			'customer' => $customer->id,
			'amount' => $amount,
			'currency' => 'usd',
		]);
		
		$wallet = Wallet::where('user_id',Auth::user()->id)->first();
		$wallet->credits = $wallet->credits + $request->credits;
		$wallet->save();
		
		return redirect()->back()->with(['success'=>'successfully']);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function withdraw()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try 
        {
            $valiadator = Validator::make($request->all(),[
                'amount' =>'required',
                //'date' =>'required',
                'reason' => 'required',
                'type' => 'required',
            ]);
            if($valiadator->fails())
            {
                return response()->json(['success'=>false,'message' => $valiadator->errors()],500);
            }       
			
			$amount = $request->amount * 100;
			$email = Auth::user()->email;

			$customer = \Stripe\Customer::create([
				'email' => $email,
				'source' => $request->input('pm_id'),
			]);

			$charge = \Stripe\Charge::create([
				'customer' => $customer->id,
				'amount' => $amount,
				'currency' => 'usd',
			]);

			$wallet = Wallet::where('user_id',Auth::user()->id)->first();
			if(!$wallet)
			{
				Wallet::create([
					'amount' => $request->amount,
					'user_id' => Auth::user()->id,
					]);
			}
			else{	
				$wallet->amount = $wallet->amount + $request->amount;
				$wallet->save();
			}
            $data = Tranasaction::create([
                'user_id' => Auth::user()->id,
                'amount' => $request->amount,
                //'date' => $request->date,
                'reason' => $request->reason,
                'type' => $request->type,
				'pm_id' => $customer->id,
                //'status' => 'Pending',
            ]);
            
            

            $user = User::with('wallet','temporary_address')->where('id',Auth::user()->id)->first();
            return response()->json(['success'=>true,'message' => 'Tranasaction SuccessFully','data'=> $data,'user_info'=>$user]);
            
        } catch (\Stripe\Error\Card $e) {
            return response()->json(['error' => $e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Tranasaction  $tranasaction
     * @return \Illuminate\Http\Response
     */
    public function show(Tranasaction $tranasaction)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Tranasaction  $tranasaction
     * @return \Illuminate\Http\Response
     */
    public function edit(Tranasaction $tranasaction)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Tranasaction  $tranasaction
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Tranasaction $tranasaction)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Tranasaction  $tranasaction
     * @return \Illuminate\Http\Response
     */
    public function destroy(Tranasaction $tranasaction)
    {
        //
    }
}
