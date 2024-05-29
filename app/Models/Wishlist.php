<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wishlist extends Model
{
    use HasFactory;
    protected $table = 'wishlist';
    protected $guarded = [];

    public function barber_info()
    {
        return $this->hasOne(User::class, "id", "barber_id");
    }
    
    public function products()
    {
        return $this->hasOne(Products::class, "id", "product_id");
    }
}
