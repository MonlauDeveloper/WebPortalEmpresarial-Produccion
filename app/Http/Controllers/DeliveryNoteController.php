<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\DeliveryNote;
use App\Models\Company;
use App\Models\Wholesaler;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class DeliveryNoteController extends Controller
{    /**
     * Display a listing of delivery notes for the current company
     */
    public function index($company)
    {
        // El middleware isCompanyEmployee ya ha establecido current_company en Auth::user()
        $currentCompany = Auth::user()->current_company;
        $deliveryNotes = DeliveryNote::where('company_id', $currentCompany)
            // De-normalizado para mayor claridad: Se asegura que el albarán esté vinculado a un mayorista
            ->whereNotNull('wholesaler_id')
            ->with(['wholesaler', 'company', 'order'])
            ->orderBy('created_at', 'desc')
            ->paginate(10);
            
        return view('web.sections.authorized.student.delivery-notes', compact('deliveryNotes'));
    }
      /**
     * Display a specific delivery note
     */
    public function show($company, $id)
    {
        // El middleware isCompanyEmployee ya ha establecido current_company en Auth::user()
        $currentCompany = Auth::user()->current_company;
        $deliveryNote = DeliveryNote::where('id', $id)
            ->where('company_id', $currentCompany)
            ->whereNotNull('wholesaler_id') // Solo albaranes de mayoristas
            ->with(['order.products.wholesalerProduct', 'wholesaler', 'company'])
            ->firstOrFail();
            
        return view('web.sections.authorized.student.delivery-note-detail', compact('deliveryNote'));
    }
      /**
     * Download the PDF for a delivery note
     */
    public function download($company, $id)
    {
        \Log::info("Intentando descargar albarán ID: $id");
        
        // El middleware isCompanyEmployee ya ha establecido current_company en Auth::user()
        $currentCompany = Auth::user()->current_company;
        $deliveryNote = DeliveryNote::where('id', $id)
            ->where('company_id', $currentCompany)
            ->whereNotNull('wholesaler_id') // Solo albaranes de mayoristas
            ->with(['order.products.wholesalerProduct', 'wholesaler', 'company'])
            ->firstOrFail();
            
        \Log::info("Albarán encontrado: " . $deliveryNote->number . ", PDF path: " . $deliveryNote->pdf_path);
        
        // Si no hay ruta de PDF, intentar regenerarlo
        if (!$deliveryNote->pdf_path) {
            \Log::info("Intentando regenerar el PDF para el albarán ID: $id");
            try {
                $this->regeneratePdf($deliveryNote);
                // Recargar el albarán para obtener la nueva ruta PDF si se ha generado
                $deliveryNote = DeliveryNote::find($id);
                
                if (!$deliveryNote->pdf_path) {
                    \Log::error("No se pudo regenerar el PDF para el albarán ID: $id");
                    return back()->with('error', 'No se pudo generar el PDF del albarán. Por favor contacte al soporte técnico.');
                }
            } catch (\Exception $e) {
                \Log::error("Error al regenerar PDF: " . $e->getMessage());
                \Log::error("Traza: " . $e->getTraceAsString());
                return back()->with('error', 'Error al regenerar el PDF del albarán: ' . $e->getMessage());
            }
        }
        
        $fullPath = 'public/' . $deliveryNote->pdf_path;
        $filePath = storage_path('app/' . $fullPath);
        
        \Log::info("Verificando archivo en: $fullPath");
        
        // Verificar si el archivo existe
        $fileExists = Storage::exists($fullPath) || file_exists($filePath);
        
        if (!$fileExists) {
            \Log::warning("El archivo no existe, intentando regenerarlo");
            try {
                $this->regeneratePdf($deliveryNote);
                // Recargar la ruta correcta
                $deliveryNote = DeliveryNote::find($id);
                $fullPath = 'public/' . $deliveryNote->pdf_path;
                $filePath = storage_path('app/' . $fullPath);
                
                $fileExists = Storage::exists($fullPath) || file_exists($filePath);
                if (!$fileExists) {
                    \Log::error("No se pudo regenerar el PDF, sigue sin existir");
                    return back()->with('error', 'No se pudo generar correctamente el PDF del albarán');
                }
            } catch (\Exception $e) {
                \Log::error("Error al regenerar PDF: " . $e->getMessage());
                return back()->with('error', 'Error al regenerar el PDF del albarán: ' . $e->getMessage());
            }
        }
        
        \Log::info("Preparando descarga de PDF desde: " . ($fileExists ? $filePath : "ruta no encontrada"));
        
        try {
            if (file_exists($filePath)) {
                return response()->download($filePath, 'albaran_' . $deliveryNote->number . '.pdf');
            } else {
                // Intento alternativo usando Storage
                return response()->streamDownload(function() use ($fullPath) {
                    echo Storage::get($fullPath);
                }, 'albaran_' . $deliveryNote->number . '.pdf');
            }
        } catch (\Exception $e) {
            \Log::error("Error al descargar PDF: " . $e->getMessage());
            \Log::error("Traza: " . $e->getTraceAsString());
            return back()->with('error', 'Error al descargar el PDF: ' . $e->getMessage());
        }
    }
    
    /**
     * Regenera el PDF de un albarán
     * 
     * @param DeliveryNote $deliveryNote
     * @return bool
     */
    private function regeneratePdf($deliveryNote)
    {
        \Log::info("Regenerando PDF para el albarán: " . $deliveryNote->number);
        
        // Recargamos el delivery note con todas las relaciones necesarias
        $deliveryNote = DeliveryNote::where('id', $deliveryNote->id)
            ->with(['order.products.wholesalerProduct', 'wholesaler', 'company'])
            ->firstOrFail();
            
        // Calcular el total, asegurándonos de cargar manualmente los productos si es necesario
        $total = 0;
        $order = $deliveryNote->order;
        if (!$order) {
            \Log::error("Orden no encontrada para el albarán: " . $deliveryNote->number);
            return false;
        }
        
        // Cargar explícitamente los productos con sus relaciones
        $orderProducts = \App\Models\OrderProduct::where('order_id', $order->id)
            ->with('wholesalerProduct')
            ->get();
            
        \Log::info("Productos cargados para el albarán: " . count($orderProducts));
        
        foreach ($orderProducts as $orderProduct) {
            // Imprimir información de depuración para cada producto
            \Log::info("Producto ID: " . $orderProduct->id . 
                ", WholesalerProduct: " . ($orderProduct->wholesalerProduct ? $orderProduct->wholesalerProduct->name : 'No encontrado'));
                
            if ($orderProduct->wholesalerProduct) {
                $total += $orderProduct->amount * $orderProduct->wholesalerProduct->price;
            }
        }
        
        // Preparar el logo
        $wholesalerLogoBase64 = '';
        try {
            // Asegurémonos de que el directorio existe
            $wholesalersDir = storage_path('app/public/wholesalers');
            if (!file_exists($wholesalersDir)) {
                if (!mkdir($wholesalersDir, 0755, true)) {
                    \Log::error("No se pudo crear el directorio para logos de mayoristas: $wholesalersDir");
                } else {
                    \Log::info("Directorio para logos de mayoristas creado: $wholesalersDir");
                }
            }
            
            // Intentar cargar el logo si existe
            if ($deliveryNote->wholesaler && $deliveryNote->wholesaler->logo) {
                $imagePath = storage_path('app/public/wholesalers/' . $deliveryNote->wholesaler->logo);
                if (file_exists($imagePath)) {
                    $image = file_get_contents($imagePath);
                    $wholesalerLogoBase64 = base64_encode($image);
                } else {
                    \Log::warning("Logo del mayorista no encontrado: $imagePath - Usando un logo vacío");
                }
            }
        } catch (\Exception $e) {
            \Log::error("Error al cargar logo del mayorista: " . $e->getMessage());
        }
        
        // Asegurarnos de que tenemos los datos necesarios
        \Log::info("Verificando datos para el PDF: Mayorista - " . 
            ($deliveryNote->wholesaler ? $deliveryNote->wholesaler->name : 'No encontrado') . 
            ", Empresa - " . 
            ($deliveryNote->company ? $deliveryNote->company->name : 'No encontrada') . 
            ", Productos - " . count($orderProducts));
            
        // Si no tenemos el wholesaler, intentar cargarlo
        if (!$deliveryNote->wholesaler) {
            \Log::warning("Wholesaler no encontrado en relación directa, intentando cargarlo manualmente");
            $deliveryNote->wholesaler = Wholesaler::find($deliveryNote->wholesaler_id);
        }
        
        // Si no tenemos la compañía, intentar cargarla
        if (!$deliveryNote->company) {
            \Log::warning("Compañía no encontrada en relación directa, intentando cargarla manualmente");
            $deliveryNote->company = Company::find($deliveryNote->company_id);
        }
                
        // Generar el PDF
        try {
            $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('pdf.delivery_note', [
                'delivery_note' => $deliveryNote,
                'order' => $deliveryNote->order,
                'products' => $orderProducts,
                'wholesaler' => $deliveryNote->wholesaler,
                'company' => $deliveryNote->company,
                'total' => $total,
                'icon' => $wholesalerLogoBase64
            ])->setPaper('A4');
            
            // Asegurar que los directorios existen
            $storageDirectory = 'public/delivery_notes';
            $physicalDirectory = storage_path('app/public/delivery_notes');
            
            if (!\Storage::exists($storageDirectory)) {
                \Storage::makeDirectory($storageDirectory);
            }
            
            if (!file_exists($physicalDirectory)) {
                mkdir($physicalDirectory, 0755, true);
            }
            
            // Guardar el PDF
            $pdfFileName = 'albaran_' . $deliveryNote->number . '.pdf';
            $pdfPath = 'delivery_notes/' . $pdfFileName;
            $fullPath = 'public/' . $pdfPath;
            $absolutePath = storage_path('app/' . $fullPath);
            
            // Guardar usando ambos métodos
            $content = $pdf->output();
            \Storage::put($fullPath, $content);
            file_put_contents($absolutePath, $content);
            
            // Actualizar el registro
            $deliveryNote->pdf_path = $pdfPath;
            $deliveryNote->save();
            
            \Log::info("PDF regenerado correctamente para el albarán: " . $deliveryNote->number);
            return true;
            
        } catch (\Exception $e) {
            \Log::error("Error al regenerar PDF: " . $e->getMessage());
            throw $e;
        }
    }
}
