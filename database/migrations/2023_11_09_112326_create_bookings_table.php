<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id();
            $table->string('member_id')->nullable();
            $table->string('barber_id')->nullable();
            $table->string('booking_time')->nullable();
            $table->string('booking_date')->nullable();
            $table->string('price')->nullable();
            $table->string('dis_price')->nullable();
            $table->string('total_price')->nullable();
            $table->string('image')->nullable();
            $table->string('custom_location')->nullable();
            $table->string('status', 10);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bookings');
    }
};
