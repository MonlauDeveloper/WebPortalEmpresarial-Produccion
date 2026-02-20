<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wholesaler_products', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('wholesaler_id')->nullable()->index('fk_wholesaler_products_wholesaler_id');
            $table->integer('category_id')->nullable()->index('fk_wholesaler_products_category_id');
            $table->string('name', 100)->nullable();
            $table->string('reference', 100)->nullable();
            $table->longText('description')->nullable();
            $table->double('price')->nullable()->default(0);
            $table->integer('stock')->nullable()->default(0);
            $table->longText('image')->nullable();
            $table->string('status', 50)->nullable()->default('active');
            $table->boolean('is_office_related')->default(true)->comment('Indica si el producto está relacionado con entorno de oficina');
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
        Schema::dropIfExists('wholesaler_products');
    }
};