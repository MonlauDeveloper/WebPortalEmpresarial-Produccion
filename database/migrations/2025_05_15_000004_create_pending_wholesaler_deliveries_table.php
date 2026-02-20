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
        Schema::create('pending_wholesaler_deliveries', function (Blueprint $table) {
            $table->id();
            $table->integer('order_id');
            $table->integer('company_id');
            $table->date('delivery_date');
            $table->boolean('processed')->default(false);
            $table->timestamps();
            
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->foreign('company_id')->references('id')->on('companies')->onDelete('cascade');
        });
        
        // Añadir campo stock a productos
        Schema::table('products', function (Blueprint $table) {
            $table->integer('stock')->default(0)->after('price');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pending_wholesaler_deliveries');
        
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn('stock');
        });
    }
};
