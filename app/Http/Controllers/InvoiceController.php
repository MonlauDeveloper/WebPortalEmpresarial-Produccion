<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Invoice;
use App\Models\Company;
use App\Models\CompanyEmployee;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;

class InvoiceController extends Controller
{
    /**
     * Display a listing of invoices for the current company
     */
    public function index($company = null)
    {
        try {
            // Intentar conseguir la empresa de tres formas diferentes
            $currentCompany = null;
            
            // 1. De la ruta (pasado por el middleware)
            if (Auth::user()->current_company) {
                $currentCompany = Auth::user()->current_company;
            }
            
            // 2. Del parámetro de la URL
            else if ($company) {
                // Puede ser ID o nombre
                if (is_numeric($company)) {
                    $companyObj = Company::find($company);
                    if ($companyObj) $currentCompany = $companyObj->id;
                } else {
                    $companyObj = Company::where('name', str_replace('-', ' ', $company))->first();
                    if ($companyObj) $currentCompany = $companyObj->id;
                }
            }
            
            // 3. Buscar las empresas a las que pertenece el usuario y tomar la primera
            if (!$currentCompany) {
                $companyEmployee = CompanyEmployee::where('user_id', Auth::user()->id)->first();
                if ($companyEmployee) {
                    $currentCompany = $companyEmployee->company_id;
                    
                    // Actualizar la empresa actual en el usuario
                    Auth::user()->current_company = $currentCompany;
                    Auth::user()->save();
                }
            }
            
            // Si aún no tenemos empresa, redirigir a selección
            if (!$currentCompany) {
                return redirect()->route('student.select')
                    ->with('error', 'Por favor, selecciona primero una empresa.');
            }
            
            // Asegurarse de que el usuario tiene acceso a esta empresa
            $hasAccess = CompanyEmployee::where('user_id', Auth::user()->id)
                ->where('company_id', $currentCompany)
                ->exists();
                
            if (!$hasAccess) {
                return redirect()->route('student.select')
                    ->with('error', 'No tienes acceso a esta empresa.');
            }
            
            $invoices = Invoice::where('company_id', $currentCompany)
                ->with(['wholesaler', 'company', 'order'])
                ->orderBy('created_at', 'desc')
                ->paginate(10);
                
        } catch (\Exception $e) {
            Log::error('Error al cargar facturas: ' . $e->getMessage());
            return redirect()->route('student.select')
                ->with('error', 'Ha ocurrido un error al cargar las facturas. Por favor, intenta de nuevo.');
        }
            
        return view('web.sections.authorized.student.invoices', compact('invoices'));
    }

    /**
     * Display a specific invoice
     */
    public function show($company = null, $id)
    {
        try {
            // Obtener la empresa actual del usuario
            $currentCompany = Auth::user()->current_company;
            
            if (!$currentCompany) {
                return redirect()->route('student.select')
                    ->with('error', 'Por favor, selecciona primero una empresa.');
            }
            
            // Buscar la factura
            $invoice = Invoice::where('id', $id)
                ->where('company_id', $currentCompany)
                ->with(['order.products.wholesalerProduct', 'wholesaler', 'company'])
                ->first();
                
            if (!$invoice) {
                return redirect()->route('company.invoices.index', ['company' => $company])
                    ->with('error', 'No se encontró la factura solicitada o no tienes permisos para verla.');
            }
            
            return view('web.sections.authorized.student.invoice-detail', compact('invoice'));
        } catch (\Exception $e) {
            Log::error('Error al mostrar factura: ' . $e->getMessage());
            return redirect()->route('company.invoices.index', ['company' => $company])
                ->with('error', 'Ha ocurrido un error al cargar la factura. Por favor, intenta de nuevo.');
        }
    }

    /**
     * Download the PDF for a invoice
     */
    public function download($company = null, $id)
    {
        try {
            // Obtener la empresa actual del usuario
            $currentCompany = Auth::user()->current_company;
            
            if (!$currentCompany) {
                return redirect()->route('student.select')
                    ->with('error', 'Por favor, selecciona primero una empresa.');
            }
            
            // Buscar la factura
            $invoice = Invoice::where('id', $id)
                ->where('company_id', $currentCompany)
                ->first();
                
            if (!$invoice) {
                return redirect()->route('company.invoices.index', ['company' => $company])
                    ->with('error', 'No se encontró la factura solicitada o no tienes permisos para verla.');
            }
            
            if (!$invoice->pdf_path) {
                return back()->with('error', 'La ruta del archivo PDF no está definida en la factura');
            }
            
            $pdfPath = storage_path('app/public/' . $invoice->pdf_path);
            
            // Verificar explícitamente si el archivo existe en el sistema de archivos
            if (!file_exists($pdfPath)) {
                Log::error('PDF no encontrado: ' . $pdfPath);
                
                // Intentar regenerar el PDF
                $this->regenerateInvoicePdf($invoice);
                
                // Verificar nuevamente si el archivo existe después de regenerar
                if (!file_exists($pdfPath)) {
                    return back()->with('error', 'No se pudo encontrar el archivo PDF de la factura');
                }
            }
            
            return response()->download($pdfPath, 'factura_' . $invoice->number . '.pdf');
                
        } catch (\Exception $e) {
            Log::error('Error al descargar factura: ' . $e->getMessage());
            return redirect()->route('company.invoices.index', ['company' => $company])
                ->with('error', 'Ha ocurrido un error al descargar la factura. Por favor, intenta de nuevo.');
        }
    }

    /**
     * Regenerate the PDF for an invoice if it doesn't exist
     */
    private function regenerateInvoicePdf($invoice)
    {
        try {
            // Cargar las relaciones necesarias para generar el PDF
            $invoice->load(['order.products.wholesalerProduct', 'wholesaler', 'company']);
            
            // Verificar que tenemos toda la información necesaria
            if (!$invoice->order || !$invoice->wholesaler || !$invoice->company) {
                Log::error('No se puede regenerar el PDF: faltan relaciones necesarias');
                return false;
            }
            
            // Obtener la imagen del mayorista para el PDF si existe
            $wholesalerLogoBase64 = '';
            if ($invoice->wholesaler->icon) {
                $imagePath = storage_path('app/public/wholesalers/' . $invoice->wholesaler->icon);
                if (file_exists($imagePath)) {
                    $image = file_get_contents($imagePath);
                    $wholesalerLogoBase64 = base64_encode($image);
                }
            }
            
            // Regenerar el PDF
            $orderProducts = $invoice->order->products;
            
            $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('pdf.invoice', [
                'invoice' => $invoice,
                'order' => $invoice->order,
                'products' => $orderProducts,
                'wholesaler' => $invoice->wholesaler,
                'company' => $invoice->company,
                'icon' => $wholesalerLogoBase64
            ])->setPaper('A4');
            
            // Asegurarse de que el directorio existe con permisos correctos
            $directory = 'public/invoices';
            if (!Storage::exists($directory)) {
                Storage::makeDirectory($directory, 0755);
            }
            
            // Guardar el PDF nuevamente
            $pdfFileName = 'factura_' . str_replace('/', '_', $invoice->number) . '.pdf';
            $pdfPath = 'invoices/' . $pdfFileName;
            Storage::put('public/' . $pdfPath, $pdf->output());
            
            // Asegurarnos de que el archivo tenga los permisos correctos
            $fullPath = storage_path('app/public/' . $pdfPath);
            if (file_exists($fullPath)) {
                chmod($fullPath, 0644);
            }
            
            // Actualizar la ruta en el modelo si es necesario
            if ($invoice->pdf_path != $pdfPath) {
                $invoice->pdf_path = $pdfPath;
                $invoice->save();
            }
            
            return true;
        } catch (\Exception $e) {
            Log::error('Error al regenerar el PDF: ' . $e->getMessage());
            return false;
        }
    }
}
