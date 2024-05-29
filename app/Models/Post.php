<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    protected $guarded = [];
    
    public function barber_info()
    {
        return $this->belongsTo(\App\Models\User::class,'barber_id');
    }
    
    public function user_info()
    {
        return $this->belongsTo(\App\Models\User::class,'user_id');
    }
    
    public function reply()
    {
        return $this->hasOne(\App\Models\PostReply::class,'post_id','id');
    }
}
