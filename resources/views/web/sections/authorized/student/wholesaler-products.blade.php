@extends('web.layouts.sidebar')

@section('body')
    <main class="w-full p-10">
        <section class="flex flex-col gap-1 mb-3">
            <h2 class="text-2xl font-extrabold text-blue-500">
                Productos de Mayoristas
            </h2>

            <small>Explora y compra productos de los mayoristas asignados a tu empresa</small>
        </section>

        @livewire('sections.authorized.student.wholesaler-products')
    </main>
@endsection
