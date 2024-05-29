<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServiceTiming extends Model
{
    protected $guarded = [];

    public function booking()
    {
        return $this->hasOne(Booking::class,'service_time_id','id')->select('service_time_id','status');
    }

}
