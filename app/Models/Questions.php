<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Questions extends Model
{
    use HasFactory;
    protected $guarded = [];
    
    
    public function answer()
    {
        return $this->hasOne(\App\Models\QueAnswer::class ,'question_id','id')->where('user_id',request('id'));
    }
}
