<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Factura</title>

    <!-- Invoice styling -->
    <style>
        body {
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            text-align: center;
            color: #777;
        }

        body h1 {
            font-weight: 300;
            margin-bottom: 0px;
            padding-bottom: 0px;
            color: #000;
        }

        body h3 {
            font-weight: 300;
            margin-top: 10px;
            margin-bottom: 20px;
            font-style: italic;
            color: #555;
        }

        body a {
            color: #06f;
        }

        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
            border: 1px solid #eee;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
            font-size: 16px;
            line-height: 24px;
            font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
            color: #555;
        }

        .invoice-box table {
            width: 100%;
            line-height: inherit;
            text-align: left;
            border-collapse: collapse;
        }

        .invoice-box table td {
            padding: 5px;
            vertical-align: top;
        }

        .invoice-box table tr td:nth-child(3),
        .invoice-box table tr td:nth-child(4) {
            text-align: right;
        }

        .invoice-box table tr.top table td {
            padding-bottom: 20px;
        }

        .invoice-box table tr.top table td.title {
            font-size: 45px;
            line-height: 45px;
            color: #333;
        }

        .invoice-box table tr.information table td {
            padding-bottom: 40px;
        }

        .invoice-box table tr.heading td {
            background: #eee;
            border-bottom: 1px solid #ddd;
            font-weight: bold;
        }

        .invoice-box table tr.details td {
            padding-bottom: 20px;
        }

        .invoice-box table tr.item td {
            border-bottom: 1px solid #eee;
        }

        .invoice-box table tr.item.last td {
            border-bottom: none;
        }

        .invoice-box table tr.total td {
            border-top: 1px solid #eee;
            font-weight: bold;
        }

        .summary-box {
            width: 250px;
            float: right;
            margin-top: 20px;
            border: 1px solid #eee;
            padding: 10px;
            margin-bottom: 40px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
        }

        .bold {
            font-weight: bold;
        }

        @media only screen and (max-width: 600px) {
            .invoice-box table tr.top table td {
                width: 100%;
                display: block;
                text-align: center;
            }

            .invoice-box table tr.information table td {
                width: 100%;
                display: block;
                text-align: center;
            }
        }
    </style>
</head>

<body>
    <div class="invoice-box">
        <table>
            <tr class="top">
                <td colspan="4">
                    <table>
                        <tr>
                            <td class="title">
                                <img src="data:image/png;base64,{{ $icon }}" alt="Logotipo" style="width: 100%; max-width: 100px" />
                            </td>
                            <td>
                                <strong>FACTURA</strong><br />
                                Número: {{ $invoice->number }}<br />
                                Fecha de emisión: {{ date('d/m/Y', strtotime($invoice->issue_date)) }}<br />
                                Referencia Pedido: {{ $order->serial }}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr class="information">
                <td colspan="4">
                    <table>
                        <tr>
                            <td>
                                <strong>Proveedor:</strong><br />
                                {{ $wholesaler->name }}<br />
                                {{ $wholesaler->social_denomination }}<br />
                                {{ $wholesaler->location }}<br />
                                {{ $wholesaler->city }}<br />
                                CIF: {{ $wholesaler->cif }}
                            </td>
                            <td>
                                <strong>Cliente:</strong><br />
                                {{ $company->name }}<br />
                                {{ $company->social_denomination }}<br />
                                {{ $company->location }}<br />
                                {{ $company->city }} {{ $company->cp }}<br />
                                CIF: {{ $company->cif }}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr class="heading">
                <td>Referencia</td>
                <td>Producto</td>
                <td>Cantidad</td>
                <td>Precio</td>
            </tr>

            @foreach($products as $product)
            <tr class="item">
                <td>{{ $product->wholesalerProduct->reference }}</td>
                <td>{{ $product->wholesalerProduct->name }}</td>
                <td>{{ $product->amount }}</td>
                <td>{{ number_format($product->wholesalerProduct->price, 2) }}€</td>
            </tr>
            @endforeach

        </table>

        <div class="summary-box">
            <div class="summary-row">
                <span>Subtotal:</span>
                <span>{{ number_format($invoice->subtotal, 2) }}€</span>
            </div>
            <div class="summary-row">
                <span>IVA ({{ number_format($invoice->tax_rate, 0) }}%):</span>
                <span>{{ number_format($invoice->tax_amount, 2) }}€</span>
            </div>
            <div class="summary-row bold">
                <span>Total:</span>
                <span>{{ number_format($invoice->total, 2) }}€</span>
            </div>
        </div>

        <div style="clear: both; margin-top: 60px;">
            <p><strong>Condiciones de pago:</strong></p>
            <p>Pago a {{ $wholesaler->payment_days }} días desde la fecha de la factura.</p>
            
            @if($wholesaler->disccount > 0)
            <p><strong>Descuento aplicado:</strong> {{ $wholesaler->disccount }}%</p>
            @endif
            
            @if($invoice->notes)
            <p><strong>Notas adicionales:</strong></p>
            <p>{{ $invoice->notes }}</p>
            @endif
        </div>
    </div>
</body>
</html>
