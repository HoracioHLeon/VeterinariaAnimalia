<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCServiciosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_servicios', function (Blueprint $table) {
            $table->integer('idServicio')->nullable($value = false);
            $table->string('Servicio',250)->nullable($value = false);
            $table->text('DescripcionServicio')->nullable($value = true);
            $table->decimal('CostoServicio', $precision = 8, $scale = 2)->nullable($value = false);
            $table->primary('idServicio');
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
        Schema::dropIfExists('c_servicios');
    }
}
