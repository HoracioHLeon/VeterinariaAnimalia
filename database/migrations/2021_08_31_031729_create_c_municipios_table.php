<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCMunicipiosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_municipios', function (Blueprint $table) {
            $table->integer('idPais')->nullable($value = false);
            $table->integer('idEstado')->nullable($value = false);
            $table->integer('idMunicipio')->nullable($value = false);
            $table->string('NombreMunicipio',250)->nullable($value = false);
            $table->string('CabeceraMunicipal',10)->nullable($value = false);
            $table->primary(['idPais', 'idEstado','idMunicipio']);
            $table->foreign(['idPais', 'idEstado'])->references(['idPais', 'idEstado'])->on('c_estados');
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
        Schema::dropIfExists('c_municipios');
    }
}
