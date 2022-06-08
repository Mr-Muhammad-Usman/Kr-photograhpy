<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\APIController;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('get-user',[APIController::class,'getUser'])->name('getUser');
Route::post('add-user',[APIController::class,'addUser'])->name('addUser');
Route::put('update-user/{id}',[APIController::class,'updateUser'])->name('updateUser');
Route::delete('delete-user/{id}',[APIController::class,'deleteUser'])->name('deleteUser');
