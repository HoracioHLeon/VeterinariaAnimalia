<?php

namespace App\Http\Controllers;

use App\Models\mascota;
use App\Models\cita;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MascotaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $datos['mascota'] = DB::select('CALL sp_select_all_mascota()');
        return view('mascota.index',$datos);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('mascota.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $datosCliente = request()->all();
        $datosCliente = request()->except('_token');
        //veterinario::insert($datosVeterinario);
        DB::select('CALL sp_insert_mascota(?,?,?,?,?,?,?,?,?,?,?,?)', 
        [ 
        $request->idAnimal, 
        $request->idRazaAnimal, 
        $request->idCliente, 
        $request->NumMascota,
        $request->Sexo,
        $request->FechaNacimiento,
        $request->Altura,
        $request->idVeterinario,
        $request->idServicio,
        $request->FechaNCita,
        $request->Hora,
        $request->Descripcion]);
        $datos['mascota'] = DB::select('CALL sp_select_all_mascota()');
        return view('mascota.index',$datos);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\mascota  $mascota
     * @return \Illuminate\Http\Response
     */
    public function show(mascota $mascota)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\mascota  $mascota
     * @return \Illuminate\Http\Response
     */
    public function edit($idMascota)
    {
        //
        $datos['mascota'] = DB::select('CALL sp_edit_mascota(?)', [$idMascota]);
        return view('mascota.edit', $datos);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\mascota  $mascota
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $idMascota)
    {
        //
        $datosMascota = request()->except(['_token','_method','idServicio','FechaNCita','Hora','Descripcion']);
        mascota::where('idMascota','=',$idMascota)->update($datosMascota);
        $datosMascotaCita = request()->except(['_token','_method','idAnimal','idRazaAnimal','idCliente','NumMascota','Sexo','FechaNacimiento', 'Altura']);
        cita::where('idMascota','=',$idMascota)->update($datosMascotaCita);
        
        $datos['mascota'] = DB::select('CALL sp_edit_mascota(?)', [$idMascota]);
        return view('mascota.edit', $datos);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\mascota  $mascota
     * @return \Illuminate\Http\Response
     */
    public function destroy($idMascota)
    {
        //
        DB::delete('delete from citas where idMascota = ?', [$idMascota]);
        DB::delete('delete from mascotas where idMascota = ?', [$idMascota]);
        return redirect('mascota');
    }
}
