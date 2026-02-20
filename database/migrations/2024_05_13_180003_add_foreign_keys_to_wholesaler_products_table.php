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
        Schema::table('wholesaler_products', function (Blueprint $table) {
            $table->foreign(['wholesaler_id'], 'fk_wholesaler_products_wholesaler_id')->references(['id'])->on('wholesalers')->onUpdate('CASCADE')->onDelete('CASCADE');
            $table->foreign(['category_id'], 'fk_wholesaler_products_category_id')->references(['id'])->on('product_categories')->onUpdate('CASCADE')->onDelete('SET NULL');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('wholesaler_products', function (Blueprint $table) {
            $table->dropForeign('fk_wholesaler_products_wholesaler_id');
            $table->dropForeign('fk_wholesaler_products_category_id');
        });
    }
};