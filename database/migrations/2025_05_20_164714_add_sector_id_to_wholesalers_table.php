<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('wholesalers', function (Blueprint $table) {
            // Solo añade la columna si NO existe ya
            if (!Schema::hasColumn('wholesalers', 'sector_id')) {
                $table->unsignedBigInteger('sector_id')->nullable()->after('tax');
            }
            $table->foreign('sector_id')->references('id')->on('wholesaler_sector')->onDelete('set null');
            if (Schema::hasColumn('wholesalers', 'sector')) {
                $table->dropColumn('sector');
            }
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('wholesalers', function (Blueprint $table) {
            $table->string('sector', 70)->nullable();
            $table->dropForeign(['sector_id']);
            $table->dropColumn('sector_id');
        });
    }
};
