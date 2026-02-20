@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Albarán #{{ $deliveryNote->number }}</h4>
                    <a href="{{ route('delivery-notes.index') }}" class="btn btn-sm btn-secondary">
                        <i class="fa fa-arrow-left"></i> Volver
                    </a>
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

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h5>Información del Albarán</h5>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Número:</th>
                                    <td>{{ $deliveryNote->number }}</td>
                                </tr>
                                <tr>
                                    <th>Fecha de Emisión:</th>
                                    <td>{{ $deliveryNote->issue_date->format('d/m/Y') }}</td>
                                </tr>
                                <tr>
                                    <th>Fecha de Entrega:</th>
                                    <td>{{ $deliveryNote->delivery_date ? $deliveryNote->delivery_date->format('d/m/Y') : 'No especificada' }}</td>
                                </tr>
                                <tr>
                                    <th>Estado:</th>
                                    <td>
                                        @if($deliveryNote->status == 'pending')
                                            <span class="badge bg-warning">Pendiente</span>
                                        @else
                                            <span class="badge bg-success">Entregado</span>
                                        @endif
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <h5>Detalles del Pedido</h5>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Número de Pedido:</th>
                                    <td>{{ $deliveryNote->order->serial }}</td>
                                </tr>
                                <tr>
                                    <th>Mayorista:</th>
                                    <td>{{ $deliveryNote->wholesaler->name }}</td>
                                </tr>
                                <tr>
                                    <th>Empresa Compradora:</th>
                                    <td>{{ $deliveryNote->company->name }}</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <h5>Productos</h5>
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th class="text-end">Precio Unitario</th>
                                    <th class="text-end">Importe</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php $total = 0; @endphp
                                @foreach($deliveryNote->order->orderProducts as $product)
                                    @if($product->wholesaler_product_id)
                                        @php 
                                            $amount = $product->amount * $product->wholesalerProduct->price;
                                            $total += $amount;
                                        @endphp
                                        <tr>
                                            <td>{{ $product->wholesalerProduct->name }}</td>
                                            <td>{{ $product->amount }}</td>
                                            <td class="text-end">{{ number_format($product->wholesalerProduct->price, 2) }}€</td>
                                            <td class="text-end">{{ number_format($amount, 2) }}€</td>
                                        </tr>
                                    @endif
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="3" class="text-end">Total:</th>
                                    <th class="text-end">{{ number_format($total, 2) }}€</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>

                    @if($deliveryNote->notes)
                    <div class="mt-4">
                        <h5>Observaciones</h5>
                        <div class="card">
                            <div class="card-body">
                                {{ $deliveryNote->notes }}
                            </div>
                        </div>
                    </div>
                    @endif

                    <div class="mt-4 text-center">
                        @php
                            $company = \App\Models\Company::find(Auth::user()->current_company);
                            $companySlug = $company ? str_replace(' ', '-', $company->name) : '';
                        @endphp
                        <a href="{{ route('delivery-notes.download', ['company' => $companySlug, 'id' => $deliveryNote->id]) }}" class="btn btn-primary">
                            <i class="fa fa-download"></i> Descargar PDF
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
