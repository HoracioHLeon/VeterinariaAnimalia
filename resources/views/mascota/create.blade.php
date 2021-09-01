@extends('layouts.app')
@section('contenedor')
<form class="row g-3" method="post" action="{{url('/mascota')}}">
{{ csrf_field() }}
  
  <div class="col-md-12">
    <label for="idCliente" class="form-label">{{'idCliente'}}</label>
    <input type="number" class="form-control" name="idCliente" id="idCliente" value="" required>
  </div>
  <div class="col-md-12">
    <label for="idVeterinario" class="form-label">{{'idVeterinario'}}</label>
    <input type="number" class="form-control" name="idVeterinario" id="idVeterinario" value="" required>
  </div>
  <div class="col-md-12">
    <label for="NumMascota" class="form-label">{{'Numero Mascota'}}</label>
    <input type="number" class="form-control" name="NumMascota" id="NumMascota" value="" required>
  </div>
  <div class="col-md-2">
    <label for="NombreAnimal" class="form-label">{{'NombreAnimal'}}</label>
    <select name="idAnimal" class="form-select">
        <option value="1">Perro</option>
        <option value="2">Gato</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="RazaAnimal" class="form-label">{{'RazaAnimal'}}</label>
    <select name="idRazaAnimal" class="form-select">
        <option value="1">Pastor Aleman</option>
        <option value="2">Bengala</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="Sexo" class="form-label">{{'Sexo'}}</label>
    <select name="Sexo" class="form-select">
        <option value="Macho">Macho</option>
        <option value="Hembra">Hembra</option>
    </select>
  </div>
  <div class="col-12">
    <label for="FechaNacimiento" class="form-label">{{'Fecha Nacimiento'}}</label>
    <input type="text" class="form-control" name="FechaNacimiento" id="FechaNacimiento" value="" required>
  </div>
  <div class="col-12">
    <label for="Altura" class="form-label">{{'Altura'}}</label>
    <input type="text" class="form-control" name="Altura" id="Altura" value="" required>
  </div>
  <div class="col-md-2">
    <label for="Servicio" class="form-label">{{'Servicio'}}</label>
    <select name="idServicio" class="form-select">
        <option value="1">Vacunacion</option>
        <option value="2">Cirugia</option>
    </select>
  </div>
  <div class="col-12">
    <label for="FechaNCita" class="form-label">{{'Fecha Cita'}}</label>
    <input type="text" class="form-control" name="FechaNCita" id="FechaNCita" value="" required>
  </div>
  <div class="col-12">
    <label for="Hora" class="form-label">{{'Hora'}}</label>
    <input type="text" class="form-control" name="Hora" id="Hora" value="" required>
  </div>
  
  <div class="col-md-6">
    <label for="Descripcion" class="form-label">{{'Descripcion'}}</label>
    <input type="text" class="form-control" name="Descripcion" id="Descripcion" value="" required>
  </div>
  
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Registrar</button>
  </div>
</form>
@endsection