<?php

namespace App\Http\Controllers;

use App\Models\veterinario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\DB as FacadesDB;

class VeterinarioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $datos['veterinario'] = DB::select('CALL sp_select_all_veterinario()');
        return view('veterinario.index',$datos);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('veterinario.create');
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
        $datosVeterinario = request()->all();
        $datosVeterinario = request()->except('_token');
        //veterinario::insert($datosVeterinario);
        DB::select('CALL sp_insert_veterinario(?,?,?,?,?,?,?,?,?,?,?,?,?,?)', 
        [$request->NumEmpleado, 
        $request->Nombre, 
        $request->PrimerApellido, 
        $request->SegundoApellido, 
        $request->Genero,
        $request->NumeroTelefonico,
        $request->Correo,
        $request->idPais,
        $request->idEstado,
        $request->idMunicipio,
        $request->idLocalidad,
        $request->Calle,
        $request->NumeroExterior,
        $request->NumeroInterior]);
        $datos['veterinario'] = DB::select('CALL sp_select_all_veterinario()');
        return view('veterinario.index',$datos);
        //return response()->json($request->Nombre);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\veterinario  $veterinario
     * @return \Illuminate\Http\Response
     */
    public function show(veterinario $veterinario)
    {
        //
        //veterinario::select('select * from users where active = ?', [1])::paginate(5);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\veterinario  $veterinario
     * @return \Illuminate\Http\Response
     */
    public function edit($NumEmpleado)
    {
        //
        $datos['veterinario'] = DB::select('CALL sp_edit_veterinario(?)', [$NumEmpleado]);
        return view('veterinario.edit', $datos);

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\veterinario  $veterinario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $NumEmpleado)
    {
        //
        $datosVeterinario = request()->except(['_token','_method']);
        veterinario::where('NumEmpleado','=',$NumEmpleado)->update($datosVeterinario);
        $datos['veterinario'] = DB::select('CALL sp_edit_veterinario(?)', [$NumEmpleado]);
        return view('veterinario.edit', $datos);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\veterinario  $veterinario
     * @return \Illuminate\Http\Response
     */
    public function destroy($NumEmpleado)
    {
        //
        DB::delete('delete from veterinarios where NumEmpleado = ?', [$NumEmpleado]);
        return redirect('veterinario');
    }
}
