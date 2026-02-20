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
        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->string('number')->unique(); // Número de factura único
            $table->integer('order_id');
            $table->integer('company_id');
            $table->integer('wholesaler_id');
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->foreign('company_id')->references('id')->on('companies')->onDelete('cascade'); // Empresa compradora
            $table->foreign('wholesaler_id')->references('id')->on('wholesalers')->onDelete('cascade'); // Mayorista proveedor
            $table->date('issue_date'); // Fecha de emisión de la factura
            $table->decimal('subtotal', 10, 2); // Subtotal sin impuestos
            $table->decimal('tax_rate', 5, 2); // Tasa de impuestos (%)
            $table->decimal('tax_amount', 10, 2); // Importe de impuestos
            $table->decimal('total', 10, 2); // Total factura
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
        Schema::dropIfExists('invoices');
    }
};
