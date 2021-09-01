<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMascotasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('mascotas', function (Blueprint $table) {
            $table->integer('idMascota')->nullable($value = false);
            $table->integer('idAnimal')->nullable($value = false);
            $table->integer('idRazaAnimal')->nullable($value = false);
            $table->integer('idCliente')->nullable($value = false);
            $table->integer('NumMascota')->nullable($value = false);
            $table->string('Sexo',8)->nullable($value = false);
            $table->date('FechaNacimiento')->nullable($value = false);
            $table->decimal('Altura', $precision = 8, $scale = 2)->nullable($value = false);
            $table->primary('idMascota');
            $table->foreign('idAnimal')->references('idAnimal')->on('c_animals');
            $table->foreign('idRazaAnimal')->references('idRazaAnimal')->on('c_animal_razas');
            $table->foreign('idCliente')->references('idCliente')->on('clientes');
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
        Schema::dropIfExists('mascotas');
    }
}
