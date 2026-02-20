@extends('web.layouts.sidebar')

@section('body')
    <main class="w-full p-10">
        <section class="flex flex-col gap-1">
            <div class="flex items-center justify-between mb-5">
                <div>
                    <h2 class="text-2xl font-extrabold text-blue-500">
                        {{ $wholesaler->name }}
                    </h2>
                    <small>Catálogo de productos del mayorista</small>
                </div>
                <a href="{{ url('/teacher/wholesalers') }}" class="flex items-center gap-2 text-blue-500 hover:underline">
                    <span class="material-symbols-outlined">arrow_back</span>
                    Volver a mayoristas
                </a>
            </div>

            <div
                class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-5">
                <div class="flex flex-col items-center bg-gray-50 border border-gray-200 p-5 rounded-lg shadow-md">
                    {{-- @ Icon --}}
                    @if($wholesaler->icon && file_exists(public_path('storage/wholesalers/' . $wholesaler->icon)))
                        <img class="w-32 h-32 object-cover rounded-lg mb-3"
                            src="{{ asset('storage/wholesalers/' . $wholesaler->icon) }}" alt="{{ $wholesaler->name }}" />
                    @else
                        <div class="w-32 h-32 bg-gray-200 rounded-lg mb-3 flex items-center justify-center">
                            <span class="material-symbols-outlined text-5xl text-gray-400">store</span>
                        </div>
                    @endif
                    <h3 class="text-lg font-bold">{{ $wholesaler->name }}</h3>
                    <p class="text-sm text-gray-600">{{ $wholesaler->cif }}</p>
                </div>
                <div class="bg-gray-50 border border-gray-200 p-5 rounded-lg shadow-md">
                    <h4 class="font-semibold text-gray-700">Información general</h4>
                    <ul class="mt-2 space-y-1">
                        <li class="text-sm"><span class="font-medium">Sector:</span>
                            {{ $wholesaler->sector ? $wholesaler->sector->sector_name : 'Sin Sector' }}</li>
                        <li class="text-sm"><span class="font-medium">Denominación social:</span>
                            {{ $wholesaler->social_denomination }}</li>
                        <li class="text-sm"><span class="font-medium">País:</span> {{ $wholesaler->country }}</li>
                    </ul>
                </div>
                <div class="bg-gray-50 border border-gray-200 p-5 rounded-lg shadow-md">
                    <h4 class="font-semibold text-gray-700">Ubicación</h4>
                    <ul class="mt-2 space-y-1">
                        <li class="text-sm"><span class="font-medium">Ciudad:</span> {{ $wholesaler->city }}</li>
                        <li class="text-sm"><span class="font-medium">Dirección:</span> {{ $wholesaler->location }}
                        </li>
                    </ul>
                </div>
                <div class="bg-gray-50 border border-gray-200 p-5 rounded-lg shadow-md">
                    <h4 class="font-semibold text-gray-700">Condiciones comerciales</h4>
                    <ul class="mt-2 space-y-1">
                        <li class="text-sm"><span class="font-medium">Transporte:</span>
                            {{ $wholesaler->transport }} €</li>
                        <li class="text-sm"><span class="font-medium">Descuento:</span>
                            {{ $wholesaler->disccount }}%</li>
                        <li class="text-sm"><span class="font-medium">Días de pago:</span>
                            {{ $wholesaler->payment_days }}</li>
                        <li class="text-sm"><span class="font-medium">Impuestos:</span>
                            @if ($wholesaler->tax)
                                <span class="text-red-500">Exento</span>
                            @else
                                <span class="text-green-500">Aplicados</span>
                            @endif
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        @livewire('sections.authorized.wholesaler-products', ['id' => $wholesaler->id])
    </main>
@endsection