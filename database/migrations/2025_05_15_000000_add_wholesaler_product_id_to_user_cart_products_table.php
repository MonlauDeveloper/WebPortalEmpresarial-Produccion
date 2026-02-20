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
        Schema::table('user_cart_products', function (Blueprint $table) {
            $table->integer('wholesaler_product_id')->nullable()->after('product_id');
            $table->foreign('wholesaler_product_id')->references('id')->on('wholesaler_products')->onDelete('cascade');
            
            // Hacemos que product_id sea nullable ya que ahora podemos tener
            // o bien un product_id o un wholesaler_product_id
            $table->integer('product_id')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('user_cart_products', function (Blueprint $table) {
            $table->dropForeign(['wholesaler_product_id']);
            $table->dropColumn('wholesaler_product_id');
            $table->integer('product_id')->default(0)->change();
        });
    }
};
