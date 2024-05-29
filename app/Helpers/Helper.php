<?php

namespace App\Helpers;

use App\Models\User;
use App\Models\Questions;
use App\Models\QueAnswer;

class Helper
{
    public static function response()
    {
        $user = User::with('services','wallet','temporary_address')->firstWhere('email',$request->email);

        $totalQuestions = Questions::count();
        $answeredQuestions = QueAnswer::where('user_id',$user->id)->count();
        
        if ($answeredQuestions < $totalQuestions) {
            $user->complete_questions = 'No';
        } else {
            $user->complete_questions = QueAnswer::where('user_id',$user->id)->get();
        }
        
        return $user;
    }
}