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
        Schema::create('delivery_notes', function (Blueprint $table) {
            $table->id();
            $table->string('number')->unique(); // Número de albarán único
            $table->integer('order_id');
            $table->integer('company_id');
            $table->integer('wholesaler_id');
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->foreign('company_id')->references('id')->on('companies')->onDelete('cascade'); // Empresa compradora
            $table->foreign('wholesaler_id')->references('id')->on('wholesalers')->onDelete('cascade'); // Mayorista proveedor
            $table->date('issue_date'); // Fecha de emisión del albarán
            $table->date('delivery_date')->nullable(); // Fecha de entrega prevista
            $table->enum('status', ['pending', 'delivered'])->default('pending');
            $table->text('notes')->nullable(); // Notas adicionales
            $table->string('pdf_path')->nullable(); // Ruta al archivo PDF generado
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('delivery_notes');
    }
};
