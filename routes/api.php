<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;




/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::get("/test",function(){
//         return "<h1>asdasd</h1>";
// });


Route::get('cron', [\App\Http\Controllers\Api\RegisterController::class, 'cron'])->name('cron');
Route::get('cron/plane', [\App\Http\Controllers\Api\RegisterController::class, 'cron_plane'])->name('cron_plane');

Route::post('register', [\App\Http\Controllers\Api\RegisterController::class, 'register']);
Route::get('noauth', [\App\Http\Controllers\Api\RegisterController::class, 'noauth'])->name('noauth');


Route::any('login', [\App\Http\Controllers\Api\RegisterController::class, 'login'])->name('login');
Route::any('verify', [\App\Http\Controllers\Api\RegisterController::class, 'verify']);
Route::post('password/email',  [\App\Http\Controllers\Api\ForgotPasswordController::class,'forget']);
Route::any('password/reset', [\App\Http\Controllers\Api\CodeCheckController::class,'index']);
Route::post('password/code/check', [\App\Http\Controllers\Api\CodeCheckController::class,'code_verify']);
// Route::get('guide', [\App\Http\Controllers\Api\CMSController::class, 'guide']);
// Route::get('term/conditions', [\App\Http\Controllers\Api\CMSController::class, 'termanscondition']);

Route::group(['middleware' => ['api','auth:api'], 'prefix' => 'auth'], function () {
    // Route::middleware('auth:api')->group( function () {
    Route::group(['prefix' => 'barber'], function () {
	    Route::resource('service',App\Http\Controllers\Api\Barber\ServiceController::class);
        Route::get('service_timing', [\App\Http\Controllers\Api\Barber\ServiceTimingController::class, 'service_timing_list']);
        Route::post('service_timing', [\App\Http\Controllers\Api\Barber\ServiceTimingController::class, 'service_timing']);
        Route::delete('service_timing/{id}', [\App\Http\Controllers\Api\Barber\ServiceTimingController::class, 'destroy']);
        Route::get('booking/list', [\App\Http\Controllers\Api\Barber\ServiceController::class, 'barber_booking_list']);
        Route::post('booking/status/{id}', [\App\Http\Controllers\Api\Barber\ServiceController::class, 'status_update']);
        // Route::post('booking/update/{id}', [\App\Http\Controllers\Api\BookingController::class, 'booking_list']);
        Route::get('video', [\App\Http\Controllers\Api\PostController::class, 'video_barber']);
        Route::post('video', [\App\Http\Controllers\Api\PostController::class, 'video_barber_post']);
        Route::post('video_delete', [\App\Http\Controllers\Api\PostController::class, 'video_reject']);

    });
    Route::post('video', [\App\Http\Controllers\Api\PostController::class, 'store']);
    Route::get('video', [\App\Http\Controllers\Api\PostController::class, 'index']);
    Route::get('service',[App\Http\Controllers\Api\Barber\ServiceController::class,'service_list']);
    Route::get('question', [\App\Http\Controllers\Api\SupportController::class, 'questions']);
    Route::post('question-answer', [\App\Http\Controllers\Api\SupportController::class, 'question_answer']);
    
    Route::post('wishlist', [\App\Http\Controllers\Api\WishlistController::class, 'wishlist']);
    Route::get('wishlist', [\App\Http\Controllers\Api\WishlistController::class, 'wishlist_get']);
    Route::get('coupon', [\App\Http\Controllers\Api\CouponController::class, 'index']);
    Route::post('change_password', [\App\Http\Controllers\Api\RegisterController::class, 'change_password']);
    Route::post('profile', [\App\Http\Controllers\Api\UserController::class, 'profile']);
	Route::post('cuurent/plan', [\App\Http\Controllers\Api\UserController::class, 'current_plan']);
    Route::get('admin/info', [\App\Http\Controllers\Api\UserController::class, 'admininfo']);
    Route::post('support/submit', [\App\Http\Controllers\Api\SupportController::class, 'support']);
    Route::get('logout', [\App\Http\Controllers\Api\RegisterController::class, 'logout']);
    Route::get('barber/list', [\App\Http\Controllers\Api\UserController::class, 'barber_list']);
	Route::post('barber/filter', [\App\Http\Controllers\Api\UserController::class, 'barber_filter']);
	//Route::get('barber/list/featured/near', [\App\Http\Controllers\Api\UserController::class, 'near_barber_featured_list']);
    Route::get('barber/detail/{id}', [\App\Http\Controllers\Api\UserController::class, 'barber_detail']);
    Route::post('barber/available_services/{id}', [\App\Http\Controllers\Api\UserController::class, 'barber_available_services']);
    Route::post('booking', [\App\Http\Controllers\Api\BookingController::class, 'booking']);
    Route::get('cancel_booking/{bookingid}', [\App\Http\Controllers\Api\BookingController::class, 'cancel_booking']);
    Route::post('review', [\App\Http\Controllers\Api\ReviewController::class, 'review']);
    Route::post('filter/service', [\App\Http\Controllers\Api\BookingController::class, 'filter_service']);
    //Route::get('barber/booking/list', [\App\Http\Controllers\Api\BookingController::class, 'barber_booking_list']);
    Route::get('booking/list', [\App\Http\Controllers\Api\BookingController::class, 'booking_list']);
    // Route::get('service/list', [\App\Http\Controllers\Api\ServiceTimingController::class, 'service_list']);
    Route::post('addcard', [\App\Http\Controllers\UserCardController::class, 'addcard']);
	Route::post('updatecard', [\App\Http\Controllers\UserCardController::class, 'updatecard']);
	
	Route::post('buy_credits', [\App\Http\Controllers\TranasactionController::class, 'buy_credits']);
	
	Route::get('transaction', [\App\Http\Controllers\TranasactionController::class, 'index']);
	Route::post('transaction', [\App\Http\Controllers\TranasactionController::class, 'store']);
});
