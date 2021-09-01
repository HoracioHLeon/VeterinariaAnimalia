<?php

namespace App\Http\Controllers;

use App\Models\cliente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $datos['cliente'] = DB::select('CALL sp_select_all_cliente()');
        return view('cliente.index',$datos);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('cliente.create');
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
        DB::select('CALL sp_insert_cliente(?,?,?,?,?,?,?,?,?,?,?,?,?)', 
        [ 
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
        $datos['cliente'] = DB::select('CALL sp_select_all_cliente()');
        return view('cliente.index',$datos);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\cliente  $cliente
     * @return \Illuminate\Http\Response
     */
    public function show(cliente $cliente)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\cliente  $cliente
     * @return \Illuminate\Http\Response
     */
    public function edit($idCliente)
    {
        //
        $datos['cliente'] = DB::select('CALL sp_edit_cliente(?)', [$idCliente]);
        return view('cliente.edit', $datos);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\cliente  $cliente
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $idCliente)
    {
        //
        $datosCliente = request()->except(['_token','_method']);
        cliente::where('idCliente','=',$idCliente)->update($datosCliente);
        $datos['cliente'] = DB::select('CALL sp_edit_cliente(?)', [$idCliente]);
        return view('cliente.edit', $datos);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\cliente  $cliente
     * @return \Illuminate\Http\Response
     */
    public function destroy($idCliente)
    {
        //
        DB::delete('delete from clientes where idCliente = ?', [$idCliente]);
        return redirect('cliente');
    }
}
