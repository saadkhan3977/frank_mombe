<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarberService extends Model
{
    use HasFactory;
    protected $guarded =[];
    
    
    public function service_info()
    {
        return $this->hasMany(Service::class,'id','service_id');
    }
}
