<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BookingDetail extends Model
{
    use HasFactory;
    protected $guarded =[];

    public function service_info()
    {
        return $this->hasOne(\App\Models\Service::class,"id","service_id");
    }
}
