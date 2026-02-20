<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\DeliveryNote;
use App\Models\Wholesaler;
use App\Models\Company;
use Illuminate\Support\Facades\Storage;

class RegenerateDeliveryNotePdfs extends Command
{    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:regenerate-delivery-note-pdfs {--id=} {--all}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Regenerate PDF files for delivery notes';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $id = $this->option('id');
        $regenerateAll = $this->option('all');

        if (!$id && !$regenerateAll) {
            $this->error('Please provide either --id=X or --all option');
            return 1;
        }

        try {
            // Prepare directory structure
            $this->prepareDirectories();

            if ($id) {
                $this->regenerateSingleNote($id);
            } else {
                $this->regenerateAllNotes();
            }

            return 0;
        } catch (\Exception $e) {
            $this->error('Error: ' . $e->getMessage());
            return 1;
        }
    }

    /**
     * Prepare necessary directories
     */
    private function prepareDirectories()
    {
        $directories = [
            storage_path('app/public/wholesalers'),
            storage_path('app/public/delivery_notes'),
        ];

        foreach ($directories as $dir) {
            if (!file_exists($dir)) {
                $this->info("Creating directory: $dir");
                if (!mkdir($dir, 0755, true)) {
                    throw new \Exception("Failed to create directory: $dir");
                }
            }
        }
    }

    /**
     * Regenerate a single delivery note PDF
     */
    private function regenerateSingleNote($id)
    {
        $deliveryNote = DeliveryNote::with(['order.products.wholesalerProduct', 'wholesaler', 'company'])
            ->find($id);

        if (!$deliveryNote) {
            $this->error("No delivery note found with ID: $id");
            return;
        }

        $this->info("Regenerating PDF for delivery note #{$id}: {$deliveryNote->number}");
        $this->regeneratePdf($deliveryNote);
        $this->info("PDF regenerated successfully");
    }

    /**
     * Regenerate all delivery notes that need PDFs
     */
    private function regenerateAllNotes()
    {
        $query = DeliveryNote::with(['order.products.wholesalerProduct', 'wholesaler', 'company']);
        
        // Focus only on those without PDFs
        $query = $query->whereNull('pdf_path');
        
        $count = $query->count();
        $this->info("Found $count delivery notes that need PDFs to be regenerated");

        if ($count === 0) {
            $this->info("No delivery notes need regeneration");
            return;
        }

        $bar = $this->output->createProgressBar($count);
        $bar->start();

        $query->chunk(10, function ($deliveryNotes) use ($bar) {
            foreach ($deliveryNotes as $note) {
                try {
                    $this->regeneratePdf($note);
                } catch (\Exception $e) {
                    $this->error("Error regenerating PDF for note #{$note->id}: " . $e->getMessage());
                }
                $bar->advance();
            }
        });

        $bar->finish();
        $this->newLine(2);
        $this->info("PDF regeneration complete");
    }

    /**
     * Regenerate the PDF for a specific delivery note
     */    private function regeneratePdf(DeliveryNote $deliveryNote)
    {
        // Reload the delivery note with all necessary relationships
        $deliveryNote = DeliveryNote::where('id', $deliveryNote->id)
            ->with(['order.products.wholesalerProduct', 'wholesaler', 'company'])
            ->firstOrFail();
              // Calculate total, ensuring relationships are loaded
        $total = 0;
        $order = $deliveryNote->order;
        if (!$order) {
            $this->error("Order not found for delivery note: " . $deliveryNote->number);
            return false;
        }
        
        // Load products explicitly with relationships
        $orderProducts = \App\Models\OrderProduct::where('order_id', $order->id)
            ->with('wholesalerProduct')
            ->get();
            
        $this->info("Products loaded for delivery note: " . count($orderProducts));
        
        foreach ($orderProducts as $orderProduct) {
            // Print debug information for each product
            $this->line("Product ID: " . $orderProduct->id . 
                ", WholesalerProduct: " . ($orderProduct->wholesalerProduct ? $orderProduct->wholesalerProduct->name : 'Not found'));
                
            if ($orderProduct->wholesalerProduct) {
                $total += $orderProduct->amount * $orderProduct->wholesalerProduct->price;
            }
        }

        // Get wholesaler logo
        $wholesalerLogoBase64 = '';
        if ($deliveryNote->wholesaler && $deliveryNote->wholesaler->logo) {
            $imagePath = storage_path('app/public/wholesalers/' . $deliveryNote->wholesaler->logo);
            if (file_exists($imagePath)) {
                $image = file_get_contents($imagePath);
                $wholesalerLogoBase64 = base64_encode($image);
            }
        }        // Check if wholesaler and company are properly loaded
        if (!$deliveryNote->wholesaler) {
            $this->warn("Wholesaler not found for delivery note {$deliveryNote->id}, trying to load manually");
            $deliveryNote->wholesaler = Wholesaler::find($deliveryNote->wholesaler_id);
        }
        
        if (!$deliveryNote->company) {
            $this->warn("Company not found for delivery note {$deliveryNote->id}, trying to load manually");
            $deliveryNote->company = Company::find($deliveryNote->company_id);
        }
        
        // Generate PDF
        $pdf = \Barryvdh\DomPDF\Facade\Pdf::loadView('pdf.delivery_note', [
            'delivery_note' => $deliveryNote,
            'order' => $deliveryNote->order,
            'products' => $orderProducts,
            'wholesaler' => $deliveryNote->wholesaler,
            'company' => $deliveryNote->company,
            'total' => $total,
            'icon' => $wholesalerLogoBase64
        ])->setPaper('A4');

        // Save PDF
        $pdfFileName = 'albaran_' . $deliveryNote->number . '.pdf';
        $pdfPath = 'delivery_notes/' . $pdfFileName;
        $fullPath = 'public/' . $pdfPath;
        $absolutePath = storage_path('app/' . $fullPath);

        // Save using both methods
        $content = $pdf->output();
        Storage::put($fullPath, $content);
        file_put_contents($absolutePath, $content);

        // Update database
        $deliveryNote->pdf_path = $pdfPath;
        $deliveryNote->save();

        return true;
    }
}
