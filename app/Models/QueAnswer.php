<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QueAnswer extends Model
{
    use HasFactory;
    protected $guarded = [];
    
    public function question()
    {
        return $this->hasOne(\App\Models\Questions::class ,'id','question_id');
    }
}
