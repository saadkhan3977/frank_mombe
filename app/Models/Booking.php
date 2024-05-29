<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;
    protected $guarded =[];
    public function barber_info()
    {
        return $this->hasOne(\App\Models\User::class,"id","barber_id");
    }

    public function service_info()
    {
        return $this->hasOne(\App\Models\Service::class,"id","barber_id");
    }

    public function booking_detail()
    {
        return $this->hasMany(\App\Models\BookingDetail::class, "booking_id","id");
    }
    public function member_info()
    {
        return $this->hasOne(\App\Models\User::class,"id","member_id");
    }

    public function review()
    {
        return $this->hasOne(\App\Models\Review::class,"booking_id","id");
    }
    
    public function booking_review()
    {
        return $this->hasOne(\App\Models\BookingReview::class,"booking_id","id");
    }
}
