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
        Schema::create('wholesaler_product_categories', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('wholesaler_id')->nullable()->index('fk_wholesaler_product_categories_wholesaler_id');
            $table->integer('product_category_id')->nullable()->index('fk_wholesaler_product_categories_product_category_id');
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
        Schema::dropIfExists('wholesaler_product_categories');
    }
};