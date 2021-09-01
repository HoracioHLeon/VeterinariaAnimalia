
@extends('layouts.app')
@section('css')
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.3/css/buttons.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css"/>
@endsection
@section('contenedor')
<h1>Mascota</h1>
<div class="table-responsive">
<table id="datos_resultados" class="table table-light table-striped table-hover table-bordered shadow-lg mt-4 display nowrap" style="width:100%">
    <thead class="thead-light">
        <tr>
            <th>#</th>
            <th>Numero mascota</th>
            <th>Descripcion animal</th>
            <th>Fecha nacimiento</th>
            <th>Cliente</th>
            <th>Servicio</th>
            <th>Fecha cita</th>
            <th>Hora cita</th>
            <th>Descripcion cita</th>
            <th>Veterinario</th>
            <th>Costo</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        @foreach($mascota as $mascota)
        <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{$mascota->NumMascota}}</td>
            <td> {{$mascota->NombreAnimal}} Raza {{$mascota->RazaAnimal}} {{$mascota->Sexo}} Altura {{$mascota->Altura}}</td>
            <td>{{$mascota->FechaNacimiento}}</td>
            <td>{{$mascota->NombreCliente}} {{$mascota->PrimerApellidoCliente}} {{$mascota->SegundoApellidoCliente}}</td>
            <td>{{$mascota->Servicio}}</td>
            <td>{{$mascota->FechaNCita}}</td>
            <td>{{$mascota->Hora}}</td>
            <td>{{$mascota->Descripcion}}</td>
            <td>{{$mascota->NombreVeterinario}} {{$mascota->PrimerApellidoVeterinario}} {{$mascota->SegundoApellidoVeterinario}}</td>
            <td>{{$mascota->CostoServicio}}</td>
            <td>
                <a href="{{url('/mascota/'.$mascota->idMascota.'/edit')}}"><button class="btn btn-warning"> Editar</button></a>
                <form method="post" action="{{url('/mascota/'.$mascota->idMascota)}}" style="display: inline;">
                    {{csrf_field()}}
                    {{method_field('DELETE')}}
                    <button type="submit" class="btn btn-danger" onclick="return confirm('¿Borrar registro?')">Borrar</button>

                </form>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@section('js')

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> 
<script src="https://cdn.datatables.net/responsive/2.2.5/js/dataTables.responsive.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.3/js/dataTables.buttons.min.js"></script> 
<script src="https://cdn.datatables.net/select/1.3.1/js/dataTables.select.min.js"></script>
<script src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>  
<script>
    $(document).ready(function() {
    $('#datos_resultados').DataTable({
        processing: true,
        responsive: true,
        "pagingType": "full_numbers"
            , "deferRender": true
            , "language": {
                "lengthMenu": "Registros por página _MENU_ ",
                "sProcessing": "Procesando...",
                "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando 0 a 0 de 0 registros",
                "infoEmpty": "No hay registros disponibles",
                "infoFiltered": "(filtrado de _MAX_ registros totales)",
                "sSearch": "Buscar:",
                "sLoadingRecords": "Cargando...",
                "decimal": ".",
                "thousands": ",",
                "paginate": {
                    "previous": "Anterior",
                    "next": "Siguiente",
                    "last": "Último",
                    "first": "Primero",
                    "page": "Página",
                    "pageOf": "de"
                }
            },
    });
} );
</script>
@endsection
</div>
@endsection