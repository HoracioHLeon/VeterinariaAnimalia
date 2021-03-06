@extends('layouts.app')
@section('css')
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/responsive/2.2.5/css/responsive.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.6.3/css/buttons.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.1/css/select.dataTables.min.css"/>
<link rel="stylesheet" type="text/css" href="https://editor.datatables.net/extensions/Editor/css/editor.dataTables.min.css"/>
@endsection
@section('contenedor')
<h1>Veterinarios</h1>
<div class="table-responsive">
<table id="datos_resultados" class="table table-light table-striped table-hover table-bordered shadow-lg mt-4 display nowrap" style="width:100%">
    <thead class="thead-light">
        <tr>
            <th>#</th>
            <th>Numero empleado</th>
            <th>Nombre completo</th>
            <th>Genero</th>
            <th>Numero Telefonico</th>
            <th>Correo</th>
            <th>Direccion</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        @foreach($veterinario as $veterinario)
        <tr>
            <td>{{$loop->iteration}}</td>
            <td>{{$veterinario->NumEmpleado}}</td>
            <td>{{$veterinario->Nombre}} {{$veterinario->PrimerApellido}} {{$veterinario->SegundoApellido}}</td>
            <td>{{$veterinario->Genero}}</td>
            <td>{{$veterinario->NumeroTelefonico}}</td>
            <td>{{$veterinario->Correo}}</td>
            <td>{{$veterinario->Calle}} #{{$veterinario->NumeroExterior}} Col {{$veterinario->NombreLocalidad}}, {{$veterinario->NombreMunicipio}}, {{$veterinario->NombreEstado}}, {{$veterinario->NombreOficialPais}}</td>
            <td>
                <a href="{{url('/veterinario/'.$veterinario->NumEmpleado.'/edit')}}"><button class="btn btn-warning"> Editar</button></a>
                <form method="post" action="{{url('/veterinario/'.$veterinario->NumEmpleado)}}" style="display: inline;">
                    {{csrf_field()}}
                    {{method_field('DELETE')}}
                    <button type="submit" class="btn btn-danger" onclick="return confirm('??Borrar registro?')">Borrar</button>

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
                "lengthMenu": "Registros por p??gina _MENU_ ",
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
                    "last": "??ltimo",
                    "first": "Primero",
                    "page": "P??gina",
                    "pageOf": "de"
                }
            },
    });
} );
</script>
@endsection
</div>
@endsection