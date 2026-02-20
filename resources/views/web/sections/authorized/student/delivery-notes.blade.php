@extends('web.layouts.sidebar')

@section('body')
<main class="w-full p-10">
    <section class="flex items-center justify-between">
        <div class="flex flex-col gap-1">
            <h2 class="text-2xl font-extrabold text-blue-500">
                Albaranes de Mayoristas
            </h2>
            <small>Listado de todos los albaranes generados por compras a mayoristas</small>
        </div>
        <div>
            @if(request()->is('teacher*'))
                <a href="{{ url('teacher/companies/'.request()->route('company').'/view/buy') }}" class="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded-lg flex items-center">
                    <span class="material-symbols-outlined mr-1">shopping_cart</span>
                    Ver compras a empresas
                </a>
            @else
                <a href="{{ url('student/'.request()->route('company').'/buy') }}" class="bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded-lg flex items-center">
                    <span class="material-symbols-outlined mr-1">shopping_cart</span>
                    Ver compras a empresas
                </a>
            @endif
        </div>
    </section>

    <div class="relative overflow-x-auto mt-10">
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

        @if($deliveryNotes->isEmpty())
            <div class="bg-blue-50 border border-blue-200 text-blue-800 px-4 py-3 rounded-md mt-5">
                <div class="flex">
                    <div class="py-1">
                        <span class="material-symbols-outlined mr-2">info</span>
                    </div>
                    <div>
                        <p class="font-bold">No hay albaranes disponibles</p>
                        <p class="text-sm">Los albaranes se generarán automáticamente cuando realice compras a mayoristas.</p>
                    </div>
                </div>
            </div>
        @else
            <table class="w-full text-sm text-left text-gray-500 bg-white overflow-hidden shadow">
                <thead class="text-xs text-gray-700 uppercase bg-gray-100">
                    <tr>
                        <th class="px-6 py-3">Número</th>
                        <th class="px-6 py-3">Mayorista</th>
                        <th class="px-6 py-3">Emisión</th>
                        <th class="px-6 py-3">Entrega</th>
                        <th class="px-6 py-3">Estado</th>
                        <th class="px-6 py-3">Acciones</th>
                    </tr>
                </thead>
                <tbody class="divide-y">
                    @foreach ($deliveryNotes as $note)
                        <tr>
                            <td class="py-4 px-6">{{ $note->number }}</td>
                            <td class="py-4 px-6">{{ $note->wholesaler->name }}</td>
                            <td class="py-4 px-6">{{ $note->issue_date->format('d/m/Y') }}</td>
                            <td class="py-4 px-6">{{ $note->delivery_date ? $note->delivery_date->format('d/m/Y') : 'No especificada' }}</td>
                            <td class="py-4 px-6">
                                @if($note->status == 'pending')
                                    <span class="text-orange-500 lowercase bg-orange-100 px-2 py-1 rounded-md border border-orange-500">Pendiente</span>
                                @else
                                    <span class="text-green-500 lowercase bg-green-100 px-2 py-1 rounded-md border border-green-500">Entregado</span>
                                @endif
                            </td>
                            <td class="py-4 px-6">
                                <div class="flex gap-2">
                                    @php
                                        $company = \App\Models\Company::find(Auth::user()->current_company);
                                        $companySlug = $company ? str_replace(' ', '-', $company->name) : '';
                                    @endphp
                                    <a href="{{ route('delivery-notes.show', ['company' => $companySlug, 'id' => $note->id]) }}" class="flex hover:scale-90 transition-all hover:opacity-70 items-center gap-2 border border-blue-500 bg-blue-500/10 text-blue-500 rounded-md py-1 px-3">
                                        <span class="material-symbols-outlined text-sm">visibility</span> Ver
                                    </a>
                                    <a href="{{ route('delivery-notes.download', ['company' => $companySlug, 'id' => $note->id]) }}" class="flex hover:scale-90 transition-all hover:opacity-70 items-center gap-2 border border-green-500 bg-green-500/10 text-green-500 rounded-md py-1 px-3">
                                        <span class="material-symbols-outlined text-sm">download</span> Descargar
                                    </a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="mt-5">
                {{ $deliveryNotes->links() }}
            </div>
        @endif
    </div>
</main>
@endsection