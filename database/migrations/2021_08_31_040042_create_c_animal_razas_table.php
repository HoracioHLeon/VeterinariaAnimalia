<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCAnimalRazasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_animal_razas', function (Blueprint $table) {
            $table->integer('idRazaAnimal')->nullable($value = false);
            $table->string('RazaAnimal',250)->nullable($value = false);
            $table->text('Descripcion')->nullable($value = true);
            $table->primary('idRazaAnimal');
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
        Schema::dropIfExists('c_animal_razas');
    }
}
