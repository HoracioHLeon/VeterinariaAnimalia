<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCLocalidadsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_localidads', function (Blueprint $table) {
            $table->integer('idPais')->nullable($value = false);
            $table->integer('idEstado')->nullable($value = false);
            $table->integer('idMunicipio')->nullable($value = false);
            $table->integer('idLocalidad')->nullable($value = false);
            $table->string('NombreLocalidad',250)->nullable($value = false);
            $table->integer('CodigoPostal')->nullable($value = false);
            $table->string('AmbitoLocalidad',1)->nullable($value = false);
            $table->primary(['idPais', 'idEstado','idMunicipio','idLocalidad']);
            $table->foreign(['idPais', 'idEstado','idMunicipio'])->references(['idPais', 'idEstado','idMunicipio'])->on('c_municipios');
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
        Schema::dropIfExists('c_localidads');
    }
}
