<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class login extends Controller
{

    public function jsondata()
    {
        $data = DB::table('login')->get();
    return response()->json(['Message'=>'cse get Success','Data'=>$data]);
    }
//    public function datasend(Request $request)
//     {
//     //   public function deleteit()
//     // {
//     //    DB::table('student')->where('id', 1)->delete();
//     //            }
// }
// public function Login()
// {

//     $data = DB::table('student')->get();
//     return response()->json(['Message'=>'cse get Success','Data'=>$data]);

// echo $request->userid;


//  }

// public function Login(Request $request)
//     {
      
//          $data = DB::table('login')->where('username',$request->userid)->first();

//          if(isset($data))
//          {
//        return response()->json(['Message'=>'Login Success']); 
//          }
//          else
//          {
//             return response()->json(['Message'=>'User id or Password Incorect']); 
//          }
//     }
      public function signup(Request $request)
    {
        echo"hello";
      $x=  DB::table('signup')->insert([
    'name' => $request->name,
    'Roll' => $request->Roll,
    'Email' => $request->Email,
    'Address' => $request->Address,
    'img' => $request->img,

    
        ]);
       return response()->json(['Message'=>$x]); 
    }


   public function insert(Request $request)
    {
        echo"hello";
      $x=  DB::table('login')->insert([
    'name' => $request->name,
    'email' => $request->email,
    'id' => $request->id,
    'password' => $request->password,

    
        ]);
       return response()->json(['Message'=>$x]); 
    }


    
}
