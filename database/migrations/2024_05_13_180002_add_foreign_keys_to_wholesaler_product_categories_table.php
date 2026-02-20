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
        Schema::table('wholesaler_product_categories', function (Blueprint $table) {
            $table->foreign(['wholesaler_id'], 'fk_wholesaler_product_categories_wholesaler_id')->references(['id'])->on('wholesalers')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign(['product_category_id'], 'fk_wholesaler_product_categories_product_category_id')->references(['id'])->on('product_categories')->onUpdate('CASCADE')->onDelete('CASCADE');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('wholesaler_product_categories', function (Blueprint $table) {
            $table->dropForeign('fk_wholesaler_product_categories_wholesaler_id');
            $table->dropForeign('fk_wholesaler_product_categories_product_category_id');
        });
    }
};