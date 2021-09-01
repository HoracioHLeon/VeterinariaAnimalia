@extends('layouts.app')
@section('contenedor')
<form class="row g-3" action="{{url('/cliente')}}" method="post">
{{csrf_field()}}
  <div class="col-md-12">
    <label for="Nombre" class="form-label">{{'Nombre'}}</label>
    <input type="text" class="form-control" name="Nombre" id="Nombre" value="" maxlength="50" pattern="[A-Za-z ]+" required>
  </div>
  <div class="col-12">
    <label for="PrimerApellido" class="form-label">{{'Primer Apellido'}}</label>
    <input type="text" class="form-control" name="PrimerApellido" id="PrimerApellido" value="" maxlength="50" pattern="[A-Za-z ]+" required>
  </div>
  <div class="col-12">
    <label for="SegundoApellido" class="form-label">{{'Segundo Apellido'}}</label>
    <input type="text" class="form-control" name="SegundoApellido" id="SegundoApellido" value="" maxlength="50" pattern="[A-Za-z ]+" required>
  </div>
  <div class="col-md-2">
    <label for="Genero" class="form-label">{{'Genero'}}</label>
    <select name="Genero" class="form-select">
        <option value="Masculino" selected>Masculino</option>
        <option value="Femenino">Femenino</option>
    </select>
  </div>
  <div class="col-md-4">
    <label for="NumeroTelefonico" class="form-label">{{'Numero Telefonico'}}</label>
    <input type="text" class="form-control" name="NumeroTelefonico" id="NumeroTelefonico" value="" maxlength="20" required>
  </div>
  
  <div class="col-md-6">
    <label for="Correo" class="form-label">{{'Correo'}}</label>
    <input type="email" class="form-control" name="Correo" id="Correo" value="" required>
  </div>
  <div class="col-md-2">
    <label for="Pais" class="form-label">{{'Pais'}}</label>
    <select name="idPais" class="form-select">
        <option value="484" selected>México</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="Estado" class="form-label">{{'Estado'}}</label>
    <select name="idEstado" class="form-select">
        <option value="7" selected>Chiapas</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="Municipio" class="form-label">{{'Municipio'}}</label>
    <select name="idMunicipio" class="form-select">
        <option value="101" selected>Tuxtla Gutierrez</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="Localidad" class="form-label">{{'Localidad'}}</label>
    <select name="idLocalidad" class="form-select">
        <option value="1" selected>Tuxtla Gutierrez</option>
    </select>
  </div>
  <div class="col-12">
    <label for="Calle" class="form-label">{{'Calle'}}</label>
    <input type="text" class="form-control" name="Calle" id="Calle" value="" required>
  </div>
  <div class="col-2">
    <label for="NumeroExterior" class="form-label">{{'Numero Exterior'}}</label>
    <input type="text" class="form-control" name="NumeroExterior" id="NumeroExterior" value="" maxlength="10" required>
  </div>
  <div class="col-2">
    <label for="NumeroInterior" class="form-label">{{'Numero Interior'}}</label>
    <input type="text" name="NumeroInterior" class="form-control" id="NumeroInterior" value="" maxlength="10" required>
  </div>
  
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Registrar</button>
  </div>
</form>
@endsection