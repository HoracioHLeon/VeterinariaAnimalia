<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCEstadosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_estados', function (Blueprint $table) {
            $table->integer('idPais')->nullable($value = false);
            $table->integer('idEstado')->nullable($value = false);
            $table->string('NombreEstado',250)->nullable($value = false);
            $table->string('NombreEstadoAbreviado',10)->nullable($value = false);
            $table->primary(['idPais', 'idEstado']);
            $table->foreign('idPais')->references('idPais')->on('c_pais');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('c_estados');
    }
}
