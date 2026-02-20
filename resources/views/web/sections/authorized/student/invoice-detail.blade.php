@extends('web.layouts.sidebar')

@section('body')
    <div class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-semibold text-gray-800">Detalle de Factura</h2>
            <a href="{{ route('company.invoices.index', ['company' => $invoice->company ? $invoice->company->name : Auth::user()->current_company]) }}" class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded-md text-sm flex items-center">
                <span class="material-symbols-outlined mr-1 text-sm">arrow_back</span>
                Volver
            </a>
        </div>

        @if (session('success'))
            <div class="bg-green-100 border border-green-200 text-green-800 px-4 py-3 rounded-md mb-4">
                {{ session('success') }}
            </div>
        @endif
        
        @if (session('error'))
            <div class="bg-red-100 border border-red-200 text-red-800 px-4 py-3 rounded-md mb-4">
                {{ session('error') }}
            </div>
        @endif

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
            <div class="bg-gray-50 p-4 rounded-lg">
                <h3 class="text-lg font-medium text-gray-800 mb-3">Información de la Factura</h3>
                <div class="grid grid-cols-2 gap-3">
                    <div class="text-gray-600">Número:</div>
                    <div>{{ $invoice->number }}</div>
                    
                    <div class="text-gray-600">Fecha de Emisión:</div>
                    <div>{{ $invoice->issue_date->format('d/m/Y') }}</div>
                    
                    <div class="text-gray-600">Referencia Pedido:</div>
                    <div>{{ $invoice->order->serial }}</div>
                </div>
            </div>
            
            <div class="bg-gray-50 p-4 rounded-lg">
                <h3 class="text-lg font-medium text-gray-800 mb-3">Partes Involucradas</h3>
                <div class="grid grid-cols-2 gap-3">
                    <div class="text-gray-600">Mayorista:</div>
                    <div>{{ $invoice->wholesaler ? $invoice->wholesaler->name : 'No disponible' }}</div>
                    
                    <div class="text-gray-600">Empresa:</div>
                    <div>{{ $invoice->company ? $invoice->company->name : 'No disponible' }}</div>
                </div>
            </div>
        </div>

        <h3 class="text-lg font-medium text-gray-800 mb-3">Productos</h3>
        <div class="overflow-x-auto mb-6">
            <table class="min-w-full bg-white border">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="py-3 px-4 text-left border">Producto</th>
                        <th class="py-3 px-4 text-left border">Referencia</th>
                        <th class="py-3 px-4 text-left border">Cantidad</th>
                        <th class="py-3 px-4 text-left border">Precio Unitario</th>
                        <th class="py-3 px-4 text-left border">Total</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @if($invoice->order && $invoice->order->products)
                        @foreach ($invoice->order->products as $product)
                            @if($product->wholesalerProduct)
                                @php $subtotal = $product->amount * $product->wholesalerProduct->price; @endphp
                                <tr>
                                    <td class="py-3 px-4 border">{{ $product->wholesalerProduct->name }}</td>
                                    <td class="py-3 px-4 border">{{ $product->wholesalerProduct->reference ?? 'N/A' }}</td>
                                    <td class="py-3 px-4 border">{{ $product->amount }}</td>
                                    <td class="py-3 px-4 border">{{ number_format($product->wholesalerProduct->price, 2) }} €</td>
                                    <td class="py-3 px-4 border">{{ number_format($subtotal, 2) }} €</td>
                                </tr>
                            @endif
                        @endforeach
                    @else
                        <tr>
                            <td colspan="5" class="py-3 px-4 text-center border">No se encontraron detalles de productos para esta factura</td>
                        </tr>
                    @endif
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4" class="py-3 px-4 text-right font-medium border">Subtotal</td>
                        <td class="py-3 px-4 font-bold border">{{ number_format($invoice->subtotal, 2) }} €</td>
                    </tr>
                    <tr>
                        <td colspan="4" class="py-3 px-4 text-right font-medium border">IVA ({{ $invoice->tax_rate }}%)</td>
                        <td class="py-3 px-4 font-bold border">{{ number_format($invoice->tax_amount, 2) }} €</td>
                    </tr>
                    <tr>
                        <td colspan="4" class="py-3 px-4 text-right font-medium border">Total</td>
                        <td class="py-3 px-4 font-bold text-blue-600 border">{{ number_format($invoice->total, 2) }} €</td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <div class="flex justify-center mt-6">
            <a href="{{ route('company.invoices.download', ['company' => $invoice->company ? $invoice->company->name : Auth::user()->current_company, 'id' => $invoice->id]) }}" class="bg-blue-500 hover:bg-blue-600 text-white px-4 py-2 rounded-md flex items-center">
                <span class="material-symbols-outlined mr-2">download</span>
                Descargar Factura
            </a>
        </div>
    </div>
@endsection
