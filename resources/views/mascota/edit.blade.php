@extends('layouts.app')
@section('contenedor')
@foreach($mascota as $mascota)
<form class="row g-3" method="post" action="{{ url('/mascota/'.$mascota->idMascota) }}">
{{ csrf_field() }}
{{ method_field('PUT') }}
  
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
    <label for="Animal" class="form-label">{{'Sexo'}}</label>
    <select name="idAnimal" class="form-select">
        <option value="Macho">Macho</option>
        <option value="Hembra">Hembra</option>
    </select>
  </div>
  <div class="col-6">
    <label for="FechaNacimiento" class="form-label">{{'Fecha Nacimiento'}}</label>
    <input type="text" class="form-control" name="FechaNacimiento" id="FechaNacimiento" value="{{$mascota->FechaNacimiento}}" required>
  </div>
  <div class="col-6">
    <label for="Altura" class="form-label">{{'Altura'}}</label>
    <input type="text" class="form-control" name="Altura" id="Altura" value="{{$mascota->Altura}}" required>
  </div>
  <div class="col-md-2">
    <label for="Servicio" class="form-label">{{'Servicio'}}</label>
    <select name="idServicio" class="form-select">
        <option value="1">Vacunacion</option>
        <option value="2">Cirugia</option>
    </select>
  </div>
  <div class="col-6">
    <label for="FechaNCita" class="form-label">{{'Fecha Cita'}}</label>
    <input type="text" class="form-control" name="FechaNCita" id="FechaNCita" value="{{$mascota->FechaNCita}}" required>
  </div>
  <div class="col-6">
    <label for="Hora" class="form-label">{{'Hora'}}</label>
    <input type="text" class="form-control" name="Hora" id="Hora" value="{{$mascota->Hora}}" required>
  </div>
  
  <div class="col-md-12">
    <label for="Descripcion" class="form-label">{{'Descripcion'}}</label>
    <input type="text" class="form-control" name="Descripcion" id="Descripcion" value="{{$mascota->Descripcion}}" required>
  </div>
  
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Guardar cambios</button>
  </div>
</form>
@endforeach
@endsection