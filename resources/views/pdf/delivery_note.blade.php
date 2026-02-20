<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Albarán de Entrega</title>

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

        .invoice-box table tr td:nth-child(2) {
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

        .invoice-box table tr.total td:nth-child(2) {
            border-top: 2px solid #eee;
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
                                <strong>ALBARÁN DE ENTREGA</strong><br />
                                Número: {{ $delivery_note->number }}<br />
                                Fecha de emisión: {{ date('d/m/Y', strtotime($delivery_note->issue_date)) }}<br />
                                Fecha de entrega: {{ date('d/m/Y', strtotime($delivery_note->delivery_date)) }}
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
                                <strong>Mayorista:</strong><br />
                                {{ $wholesaler ? $wholesaler->name : 'N/A' }}<br />
                                {{ $wholesaler && $wholesaler->address ? $wholesaler->address : 'N/A' }}<br />
                                CIF: {{ $wholesaler && $wholesaler->cif ? $wholesaler->cif : 'N/A' }}
                            </td>
                            <td>
                                <strong>Cliente:</strong><br />
                                {{ $company ? $company->name : 'N/A' }}<br />
                                {{ $company && $company->address ? $company->address : 'N/A' }}<br />
                                CIF: {{ $company && $company->cif ? $company->cif : 'N/A' }}
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr class="heading">
                <td>Referencia</td>
                <td>Producto</td>
                <td>Cantidad</td>
                <td>Precio Unitario</td>
            </tr>

            @foreach($products as $product)
            <tr class="item">
                <td>{{ $product->wholesalerProduct ? $product->wholesalerProduct->sku : 'N/A' }}</td>
                <td>{{ $product->wholesalerProduct ? $product->wholesalerProduct->name : 'Producto no encontrado' }}</td>
                <td>{{ $product->amount }}</td>
                <td>{{ $product->wholesalerProduct ? number_format($product->wholesalerProduct->price, 2) : '0.00' }}€</td>
            </tr>
            @endforeach

            <tr class="total">
                <td colspan="3"></td>
                <td>Total: {{ number_format($total, 2) }}€</td>
            </tr>
        </table>

        <div style="margin-top: 40px;">
            <p><strong>Observaciones:</strong></p>
            <p>{{ $delivery_note->notes ?? 'Sin observaciones' }}</p>
        </div>

        <div style="margin-top: 60px;">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 50%; text-align: center; border-top: 1px solid #eee;">
                        Firma del cliente
                    </td>
                    <td style="width: 50%; text-align: center; border-top: 1px solid #eee;">
                        Firma del transportista
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
