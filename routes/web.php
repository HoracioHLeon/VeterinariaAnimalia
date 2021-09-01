<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\VeterinarioController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\MascotaController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('index');
});



//Route::get('/veterinario', [VeterinarioController::class, 'index']);
//Route::get('/veterinario/create', [VeterinarioController::class, 'create']);
Route::resource('veterinario', VeterinarioController::class);
Route::resource('cliente', ClienteController::class);
Route::resource('mascota', MascotaController::class);
