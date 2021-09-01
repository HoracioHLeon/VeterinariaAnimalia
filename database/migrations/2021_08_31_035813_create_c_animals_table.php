<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCAnimalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_animals', function (Blueprint $table) {
            $table->integer('idAnimal')->nullable($value = false);
            $table->string('NombreAnimal',250)->nullable($value = false);
            $table->text('Descripcion')->nullable($value = true);
            $table->primary('idAnimal');
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
        Schema::dropIfExists('c_animals');
    }
}
