@extends('layouts.app')
@section('contenedor')
@foreach($veterinario as $veterinario)
<form class="row g-3" method="post" action="{{ url('/veterinario/'.$veterinario->NumEmpleado) }}">
{{ csrf_field() }}
{{ method_field('PUT') }}
  <div class="col-md-12">
    <label for="Nombre" class="form-label">{{'Nombre'}}</label>
    <input type="text" class="form-control" name="Nombre" id="Nombre" value="{{$veterinario->Nombre}}" maxlength="50" pattern="[A-Za-z ]+" required>
  </div>
  <div class="col-12">
    <label for="PrimerApellido" class="form-label">{{'Primer Apellido'}}</label>
    <input type="text" class="form-control" name="PrimerApellido" id="PrimerApellido" value="{{$veterinario->PrimerApellido}}" maxlength="50" pattern="[A-Za-z ]+" required>
  </div>
  <div class="col-12">
    <label for="SegundoApellido" class="form-label">{{'Segundo Apellido'}}</label>
    <input type="text" class="form-control" name="SegundoApellido" id="SegundoApellido" value="{{$veterinario->SegundoApellido}}" maxlength="50" pattern="[A-Za-z ]+" required>
  </div>
  <div class="col-md-2">
    <label for="Genero" class="form-label">{{'Genero'}}</label>
    <select name="Genero" class="form-select">
        <option value="{{$veterinario->Genero}}" selected>{{$veterinario->Genero}}</option>
        <option value="Masculino">Masculino</option>
        <option value="Femenino">Femenino</option>
    </select>
  </div>
  <div class="col-md-4">
    <label for="NumeroTelefonico" class="form-label">{{'Numero Telefonico'}}</label>
    <input type="text" class="form-control" name="NumeroTelefonico" id="NumeroTelefonico" value="{{$veterinario->NumeroTelefonico}}" maxlength="20" required>
  </div>
  
  <div class="col-md-6">
    <label for="Correo" class="form-label">{{'Correo'}}</label>
    <input type="email" class="form-control" name="Correo" id="Correo" value="{{$veterinario->Correo}}" required>
  </div>
  <div class="col-md-2">
    <label for="Pais" class="form-label">{{'Pais'}}</label>
    <select name="idPais" class="form-select">
        <option value="484" selected>{{$veterinario->NombreOficialPais}}</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="Estado" class="form-label">{{'Estado'}}</label>
    <select name="idEstado" class="form-select">
        <option value="7" selected>{{$veterinario->NombreEstado}}</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="Municipio" class="form-label">{{'Municipio'}}</label>
    <select name="idMunicipio" class="form-select">
        <option value="101" selected>{{$veterinario->NombreMunicipio}}</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="Localidad" class="form-label">{{'Localidad'}}</label>
    <select name="idLocalidad" class="form-select">
        <option value="1" selected>{{$veterinario->NombreLocalidad}}</option>
    </select>
  </div>
  <div class="col-12">
    <label for="Calle" class="form-label">{{'Calle'}}</label>
    <input type="text" class="form-control" name="Calle" id="Calle" value="{{$veterinario->Calle}}" required>
  </div>
  <div class="col-2">
    <label for="NumeroExterior" class="form-label">{{'Numero Exterior'}}</label>
    <input type="text" class="form-control" name="NumeroExterior" id="NumeroExterior" value="{{$veterinario->NumeroExterior}}" maxlength="10" required>
  </div>
  <div class="col-2">
    <label for="NumeroInterior" class="form-label">{{'Numero Interior'}}</label>
    <input type="text" name="NumeroInterior" class="form-control" id="NumeroInterior" value="{{$veterinario->NumeroInterior}}" maxlength="10" required>
  </div>
  
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Guardar cambios</button>
  </div>
</form>
@endforeach
@endsection