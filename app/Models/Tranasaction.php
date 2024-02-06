<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tranasaction extends Model
{
    use HasFactory;
	protected $table = 'transaction';
    protected $guarded = [];

    public function user()
    {
        return $this->hasOne(\App\Models\User::class,'id','user_id');
    }
    
    // public function wallet()
    // {
    //     return $this->hasOne(\App\Models\Wallet::class,'user_id','user_id');
    // }
}
