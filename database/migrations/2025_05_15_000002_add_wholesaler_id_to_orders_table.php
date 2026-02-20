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
        Schema::table('orders', function (Blueprint $table) {
            $table->integer('wholesaler_id')->nullable()->after('seller_company_id');
            $table->foreign('wholesaler_id')->references('id')->on('wholesalers')->onDelete('set null');
            
            // Hacemos el seller_company_id nullable porque las órdenes de mayoristas no tendrán una empresa vendedora
            $table->integer('seller_company_id')->nullable()->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropForeign(['wholesaler_id']);
            $table->dropColumn('wholesaler_id');
            $table->integer('seller_company_id')->nullable(false)->change();
        });
    }
};
