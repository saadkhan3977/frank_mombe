<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
// use Laravel\Passport\HasApiTokens;
use Laravel\Sanctum\HasApiTokens;



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

    public function services()
    {
        return $this->hasMany(Service::class,'user_id','id');
    }
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
