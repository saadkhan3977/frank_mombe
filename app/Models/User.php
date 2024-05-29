<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// use Laravel\Passport\HasApiTokens;
use Laravel\Sanctum\HasApiTokens;
use Auth;


class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        // 'role',
        'remember_token',
		'email_code',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    
    // protected $appends = ['complete_questions'];

    public function services()
    {
        return $this->hasMany(BarberService::class,'user_id','id');
    }
    public function main_services()
    {
        return $this->hasOne(BarberService::class,'user_id','id')->where("main_service",1);
    }
    
    // public function complete_questions()
    // {
    //     $totalQuestions = Questions::count();
    //     $answeredQuestions = QueAnswer::where('user_id', $this->id)->count();

    //     return $answeredQuestions >= $totalQuestions ? 'Yes' : 'No';
    // }
    
    // public function complete_questions()
    // {
    //     $totalQuestions = Questions::count();
    //     $answeredQuestions = QueAnswer::where('user_id',Auth::user()->id)->count();
    //     if ($answeredQuestions < $totalQuestions) 
    //     {
    //         return []   ;
    //     } else {
    //         return true;//QueAnswer::where('user_id',Auth::user()->id)->get();
            
    //     }

    // }
    
    public function service_timing()
    {
        return $this->hasMany(ServiceTiming::class,'barber_id','id');
    }

    public function available_service_timing()
    {
        return $this->hasMany(ServiceTiming::class,'barber_id','id');
    }
    public function time()
    {
        return $this->hasMany(ServiceTiming::class,'barber_id','id')->select('barber_id','time');
    }
    public function barber_info()
    {
        return $this->hasOne(Wishlist::class,'barber_id');
    }
    
    public function reviews()
    {
        return $this->hasOne(Review::class,'barber_id');
    }
    
    
    
    public function temporary_address()
    {
        return $this->hasOne(UserTemporaryAddress::class,'user_id');
    }
    public function review()
    {
        return $this->hasMany(Review::class,'barber_id');
    }

    public function user_card()
    {
        return $this->hasOne(UserCardDetail::class,'user_id','id');
    }

    public function child()
    {
        return $this->hasOne(Child::class,'user_id','id');
    }

    public function wallet()
    {
        return $this->hasOne(Wallet::class,'user_id','id');
    }

    public function temporary_wallet()
    {
        return $this->hasOne(TemporaryWallet::class,'user_id','id');
    }

    public function payments()
    {
        return $this->hasMany(Payment::class,'customer_id','stripe_id');
    }

    public function goal()
    {
        return $this->hasOne(Goal::class,'user_id','id');
    }
}
