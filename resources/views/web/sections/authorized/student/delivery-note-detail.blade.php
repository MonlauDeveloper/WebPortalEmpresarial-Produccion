@extends('web.layouts.sidebar')

@section('body')
    <main class="w-full p-10">
        <section class="flex justify-between mb-8">
            <div class="flex flex-col gap-1">
                <h2 class="text-2xl font-extrabold text-blue-500">
                    Albarán #{{ $deliveryNote->number }}
                    @php
                        $company = \App\Models\Company::find(Auth::user()->current_company);
                        $companySlug = $company ? str_replace(' ', '-', $company->name) : '';
                    @endphp
                </h2>
                <small>Detalles del albarán generado por la compra</small>
            </div>
            <div class="flex items-center">
                <a href="{{ route('delivery-notes.index', ['company' => $companySlug]) }}"
                    class="flex items-center text-gray-600 hover:text-blue-600">
                    <span class="material-symbols-outlined text-sm mr-1">arrow_back</span>
                    Volver
                </a>
            </div>
        </section>

        <div class="mb-8">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div class="bg-gray-50 border border-gray-200 rounded-lg shadow-md p-6">
                    <h3 class="font-bold mb-2 text-lg">Información del Albarán</h3>
                    <div class="flex flex-col gap-1 text-sm">
                        <div><span class="font-semibold">Número:</span> {{ $deliveryNote->number }}</div>
                        <div><span class="font-semibold">Fecha de Emisión:</span>
                            {{ $deliveryNote->issue_date->format('d/m/Y') }}</div>
                        <div><span class="font-semibold">Fecha de Entrega:</span>
                            {{ $deliveryNote->delivery_date ? $deliveryNote->delivery_date->format('d/m/Y') : 'No especificada' }}
                        </div>
                        <div>
                            <span class="font-semibold">Estado:</span>
                            @if($deliveryNote->status == 'pending')
                                <span
                                    class="text-orange-500 lowercase bg-orange-100 px-2 py-1 rounded-md border border-orange-500">pendiente</span>
                            @else
                                <span
                                    class="text-green-500 lowercase bg-green-100 px-2 py-1 rounded-md border border-green-500">entregado</span>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="bg-gray-50 border border-gray-200 rounded-lg shadow-md p-6">
                    <h3 class="font-bold mb-2 text-lg">Partes Involucradas</h3>
                    <div class="flex flex-col gap-1 text-sm">
                        <div><span class="font-semibold">Mayorista:</span> {{ $deliveryNote->wholesaler->name }}</div>
                        <div><span class="font-semibold">Empresa:</span> {{ $deliveryNote->company->name }}</div>
                        <div><span class="font-semibold">Número de Pedido:</span> {{ $deliveryNote->order->serial }}</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="bg-gray-50 border border-gray-200 rounded-lg shadow-md p-6 mb-8">
            <h3 class="font-bold mb-4">Productos</h3>
            <div class="overflow-x-auto">
                <table class="w-full text-sm text-left text-gray-500 bg-white">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-200">
                        <tr>
                            <th class="px-6 py-3">Producto</th>
                            <th class="px-6 py-3">SKU</th>
                            <th class="px-6 py-3">Cantidad</th>
                            <th class="px-6 py-3 text-end">Precio Unitario</th>
                            <th class="px-6 py-3 text-end">Importe</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php $total = 0; @endphp
                        @foreach ($deliveryNote->order->products as $product)
                            @if($product->wholesalerProduct)
                                @php $subtotal = $product->amount * $product->wholesalerProduct->price; @endphp
                                @php $total += $subtotal; @endphp
                                <tr>
                                    <td class="py-4 px-6">{{ $product->wholesalerProduct->name }}</td>
                                    <td class="py-4 px-6">{{ $product->wholesalerProduct->sku ?? 'N/A' }}</td>
                                    <td class="py-4 px-6">{{ $product->amount }}</td>
                                    <td class="py-4 px-6 text-end">{{ number_format($product->wholesalerProduct->price, 2) }} €</td>
                                    <td class="py-4 px-6 text-end">{{ number_format($subtotal, 2) }} €</td>
                                </tr>
                            @endif
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr class="border-t border-gray-200">
                            <th colspan="4" class="px-6 py-3 text-end">Total:</th>
                            <th class="px-6 py-3 text-end">{{ number_format($total, 2) }} €</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <div class="flex justify-center mt-6">
            @php
                $company = \App\Models\Company::find(Auth::user()->current_company);
                $companySlug = $company ? str_replace(' ', '-', $company->name) : '';
            @endphp
            @if($deliveryNote->pdf_path)
                <a href="{{ route('delivery-notes.download', ['company' => $companySlug, 'id' => $deliveryNote->id]) }}"
                    class="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-6 rounded-md flex items-center transition-colors">
                    <span class="material-symbols-outlined mr-2">download</span>
                    Descargar PDF
                </a>
            @else
                <button disabled
                    class="bg-gray-400 cursor-not-allowed text-white font-medium py-2 px-6 rounded-md flex items-center">
                    <span class="material-symbols-outlined mr-2">info</span>
                    PDF no disponible
                </button>
                <span class="ml-2 text-gray-600 text-sm">El PDF no ha sido generado todavía</span>
            @endif
        </div>
    </main>
@endsection