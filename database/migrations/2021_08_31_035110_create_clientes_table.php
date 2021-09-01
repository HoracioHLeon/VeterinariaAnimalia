<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateClientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clientes', function (Blueprint $table) {
            $table->integer('idCliente')->nullable($value = false);
            $table->string('Nombre',50)->nullable($value = false);
            $table->string('PrimerApellido',50)->nullable($value = false);
            $table->string('SegundoApellido',50)->nullable($value = false);
            $table->string('Genero',10)->nullable($value = false);
            $table->string('NumeroTelefonico',20)->nullable($value = false);
            $table->text('Correo')->nullable($value = false);
            $table->integer('idPais')->nullable($value = false);
            $table->integer('idEstado')->nullable($value = false);
            $table->integer('idMunicipio')->nullable($value = false);
            $table->integer('idLocalidad')->nullable($value = false);
            $table->text('Calle')->nullable($value = false);
            $table->string('NumeroExterior',10)->nullable($value = false);
            $table->string('NumeroInterior',10)->nullable($value = false);
            $table->primary('idCliente');
            $table->foreign(['idPais', 'idEstado','idMunicipio','idLocalidad'])->references(['idPais', 'idEstado','idMunicipio','idLocalidad'])->on('c_localidads');
            $table->timestamps();;
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('clientes');
    }
}
