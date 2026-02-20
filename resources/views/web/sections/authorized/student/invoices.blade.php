@extends('web.layouts.sidebar')

@section('body')
    <div class="bg-white rounded-lg shadow-md p-6 mb-6">
        <div class="flex justify-between items-center mb-4">
            <h2 class="text-xl font-semibold text-gray-800">Facturas de compras a mayoristas</h2>
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

        @if(count($invoices) == 0)
            <div class="bg-blue-50 border border-blue-200 text-blue-800 px-4 py-3 rounded-md">
                <div class="flex">
                    <div class="py-1">
                        <span class="material-symbols-outlined mr-2">info</span>
                    </div>
                    <div>
                        <p class="font-bold">No hay facturas disponibles</p>
                        <p class="text-sm">Las facturas se generarán automáticamente cuando realice compras a mayoristas.</p>
                    </div>
                </div>
            </div>
        @else
            <div class="overflow-x-auto">
                <table class="min-w-full bg-white">
                    <thead class="bg-gray-100">
                        <tr>
                            <th class="py-3 px-4 text-left">Número</th>
                            <th class="py-3 px-4 text-left">Mayorista</th>
                            <th class="py-3 px-4 text-left">Emisión</th>
                            <th class="py-3 px-4 text-left">Total</th>
                            <th class="py-3 px-4 text-left">Acciones</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y">
                        @foreach ($invoices as $invoice)
                            <tr>
                                <td class="py-3 px-4">{{ $invoice->number }}</td>
                                <td class="py-3 px-4">{{ $invoice->wholesaler ? $invoice->wholesaler->name : 'No disponible' }}</td>
                                <td class="py-3 px-4">{{ $invoice->issue_date->format('d/m/Y') }}</td>
                                <td class="py-3 px-4">{{ number_format($invoice->total, 2) }} €</td>
                                <td class="py-3 px-4">
                                    <div class="flex space-x-2">
                                        <a href="{{ route('company.invoices.show', ['company' => $invoice->company ? $invoice->company->name : Auth::user()->current_company, 'id' => $invoice->id]) }}" class="bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded-md text-sm">
                                            Ver
                                        </a>
                                        <a href="{{ route('company.invoices.download', ['company' => $invoice->company ? $invoice->company->name : Auth::user()->current_company, 'id' => $invoice->id]) }}" class="bg-green-500 hover:bg-green-600 text-white px-3 py-1 rounded-md text-sm">
                                            Descargar
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <div class="mt-6">
                {{ $invoices->links() }}
            </div>
        @endif
    </div>
@endsection
