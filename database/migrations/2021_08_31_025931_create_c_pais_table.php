<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCPaisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('c_pais', function (Blueprint $table) {
            $table->integer('idPais')->nullable($value = false);
            $table->string('CodigoAlfa2',2)->nullable($value = false);
            $table->string('CodigoAlfa3',3)->nullable($value = false);
            $table->string('NombrePais',50)->nullable($value = false);
            $table->string('NombreOficialPais',100)->nullable($value = false);
            $table->primary('idPais');
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
        Schema::dropIfExists('c_pais');
    }
}
