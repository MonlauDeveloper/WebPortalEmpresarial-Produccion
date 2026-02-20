@extends('web.layouts.sidebar')

@section('body')
    <main class="w-full p-10">
        <section class="flex flex-col gap-1">
            <h2 class="text-2xl font-extrabold text-blue-500">
                Mensajería
            </h2>

            <small>Administra y organiza tus correos de manera eficiente dentro del sistema.</small>
        </section>

        @livewire('sections.authorized.mailing')
    </main>
@endsection