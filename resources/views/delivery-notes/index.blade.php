@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>Albaranes de Mayoristas</h4>
                </div>

                <div class="card-body">
                    @if (session('success'))
                        <div class="alert alert-success" role="alert">
                            {{ session('success') }}
                        </div>
                    @endif
                    
                    @if (session('error'))
                        <div class="alert alert-danger" role="alert">
                            {{ session('error') }}
                        </div>
                    @endif

                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Número</th>
                                    <th>Mayorista</th>
                                    <th>Fecha de Emisión</th>
                                    <th>Fecha de Entrega</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($deliveryNotes as $note)
                                    <tr>
                                        <td>{{ $note->number }}</td>
                                        <td>{{ $note->wholesaler->name }}</td>
                                        <td>{{ $note->issue_date->format('d/m/Y') }}</td>
                                        <td>{{ $note->delivery_date ? $note->delivery_date->format('d/m/Y') : 'No especificada' }}</td>
                                        <td>
                                            @if($note->status == 'pending')
                                                <span class="badge bg-warning">Pendiente</span>
                                            @else
                                                <span class="badge bg-success">Entregado</span>
                                            @endif
                                        </td>
                                        <td>
                                            @php
                                                $company = \App\Models\Company::find(Auth::user()->current_company);
                                                $companySlug = $company ? str_replace(' ', '-', $company->name) : '';
                                            @endphp
                                            <a href="{{ route('delivery-notes.show', ['company' => $companySlug, 'id' => $note->id]) }}" class="btn btn-sm btn-info">
                                                <i class="fa fa-eye"></i> Ver
                                            </a>
                                            <a href="{{ route('delivery-notes.download', ['company' => $companySlug, 'id' => $note->id]) }}" class="btn btn-sm btn-primary">
                                                <i class="fa fa-download"></i> Descargar
                                            </a>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="6" class="text-center">No hay albaranes disponibles</td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex justify-content-center mt-4">
                        {{ $deliveryNotes->links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
