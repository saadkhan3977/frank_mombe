<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Questions;
use App\Models\Service;

class AdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // User::create([
        //     'first_name' => 'Frank-mombe',
        //     'last_name' => 'Admin',
        //     'email' => 'admin@gmail.com',
        //     'password' => bcrypt('admin'),
        //     'role' => 'admin',
        //     'created_at'=>\Carbon\Carbon::now(),
        //     'updated_at'=>\Carbon\Carbon::now(),

        // ]);
        
        $questions = [
            'Do u have car parking area?',
            'Do u have cafeteria',
            'Do u have airconditiner ambience',
            'Do you have security surveillance?'
        ];
        
        foreach($questions as $key => $value)
        {
            Questions::create([
                'name' => $value,
                'created_at'=>\Carbon\Carbon::now(),
                'updated_at'=>\Carbon\Carbon::now(),
            ]);
        }
        
        $services = [
            'Blow dry',
            'Blow dry with curling and striaght iron',
            'Hair cut with Blow dry',
            'Mens haircut',
            'Gloss',
            'Gel Polist',
            'Meni pedi',
            'nail cutting',
            'pink and white fill',
            'Polish change',
            'Acrylic fill',
            'partial highlight',
        ];
        
        foreach($services as $key => $value)
        {
            Service::create([
                'name' => $value,
                'created_at'=>\Carbon\Carbon::now(),
                'updated_at'=>\Carbon\Carbon::now(),
            ]);
        }
        
        
        
    }
}
