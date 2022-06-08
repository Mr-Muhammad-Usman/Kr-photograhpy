<?php

namespace App\Console\Commands;

use App\Models\CompetitionModel;
use App\Models\User;
use Illuminate\Console\Command;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class schdular extends Command
{

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'minute:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'data base update';

    /**
     * Create a new command instance.
     *
     * @return void
     */

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {


//        $checkIpData;
//        $a=new CompetitionModel;
//        $a->title='empty';
//
//
//        $ip=serverIPs();
//        $userID=Auth::user()->id;
//        echo $ip;
//            $user=User::where('id',$ip)
//            ->where('server_IP',$ip)
//            ->first();
//        if ($user)
//            {
//                echo 'yes';
//                $a->title='yes';
//            }
//            else
//            {
//                echo 'no';
//                $a->title='no';
//            }
//        echo 'empty';
//        $a->save();

//        return 0;
//        $ipaddress = '';
//        if (isset($_SERVER['HTTP_CLIENT_IP']))
//            $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
//        else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
//            $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
//        else if(isset($_SERVER['HTTP_X_FORWARDED']))
//            $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
//        else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
//            $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
//        else if(isset($_SERVER['HTTP_FORWARDED']))
//            $ipaddress = $_SERVER['HTTP_FORWARDED'];
//        else if(isset($_SERVER['REMOTE_ADDR']))
//            $ipaddress = $_SERVER['REMOTE_ADDR'];
//        else
//            $ipaddress = 'UNKNOWN';
//
//echo $ipaddress;
//echo auth()->user()->id;
//
//        $user=User::where('id',auth()->user()->id)
//            ->where('server_IP',$ipaddress)
//            ->first();
//        if($user){
//            echo 'yes';
//        }
//        else{
//            echo 'no';
////            Auth::logout();
////            return redirect()->route('index');
//        }

    }
}
