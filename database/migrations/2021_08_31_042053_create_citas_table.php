<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCitasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('citas', function (Blueprint $table) {
            $table->integer('idCita')->nullable($value = false);
            $table->integer('idVeterinario')->nullable($value = false);
            $table->integer('idServicio')->nullable($value = false);
            $table->integer('idMascota')->nullable($value = false);
            $table->date('FechaNCita')->nullable($value = false);
            $table->time('Hora')->nullable($value = false);
            $table->text('Descripcion')->nullable($value = true);
            $table->primary('idCita');
            $table->foreign('idVeterinario')->references('idVeterinario')->on('veterinarios');
            $table->foreign('idServicio')->references('idServicio')->on('c_servicios');
            $table->foreign('idMascota')->references('idMascota')->on('mascotas');
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
        Schema::dropIfExists('citas');
    }
}
