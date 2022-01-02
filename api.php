<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserTestData;
use App\Http\Controllers\student;
use App\Http\Controllers\ClassData;
use App\Http\Controllers\Testpaper;
use App\Http\Controllers\question;
use App\Http\Controllers\Login;


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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
}); 
Route::get('/category',[UserTestData::class, 'GetData']);
Route::post('/PostData',[UserTestData::class, 'PostData']);
Route :: get('/User',[ student::class,'Index']);
Route :: get('/getClass',[ClassData ::class,'getData']);
Route :: get('/getTestpaper/{cat_id}',[Testpaper ::class,'getTestpaper']);
Route :: get('/getquestion/{test_paper_id}/{test_id}',[question ::class,'getquestion']);
Route :: get('/getlogin',[ login::class,'getLogin']);
Route :: post('/getlogin',[ login::class,'insert']);
