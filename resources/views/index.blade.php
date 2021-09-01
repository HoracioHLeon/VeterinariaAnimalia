@extends('layouts.app')

@section('contenedor')

<div class="card text-center">
  <div class="card-header">
    <h1>Veterinaria Animalia</h1>
  </div>
  <div class="card-body">
    <h5 class="card-title">Bienvenidos</h5>
    <p class="card-text">
    <img src="{{asset('img/logo.jpg')}}" class="img-fluid">
    </p>
  </div>
  <div class="card-footer text-muted">
    @Humberto León
  </div>
</div>
@endsection