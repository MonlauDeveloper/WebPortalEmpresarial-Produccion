<?php

namespace App\Console\Commands;

use App\Models\DeliveryNote;
use Illuminate\Console\Command;
use App\Models\PendingWholesalerDelivery;
use App\Models\Product;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ProcessWholesalerDeliveries extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:process-wholesaler-deliveries';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Process pending wholesaler deliveries and add products to company stock';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $today = Carbon::today();

        // Get all pending deliveries that are due today or earlier and not processed yet
        $pendingDeliveries = PendingWholesalerDelivery::where('delivery_date', '<=', $today)
            ->where('processed', false)
            ->with(['order.products', 'company'])
            ->get();

        $this->info("Found {$pendingDeliveries->count()} pending deliveries to process.");

        foreach ($pendingDeliveries as $delivery) {
            try {
                DB::beginTransaction();

                if (!$delivery->order || !$delivery->order->products || count($delivery->order->products) === 0) {
                    $this->error("Delivery ID {$delivery->id} no tiene orden o productos asociados.");
                    DB::rollBack();
                    continue;
                }

                foreach ($delivery->order->products as $orderProduct) {
                    if ($orderProduct->wholesaler_product_id) {
                        $wholesalerProduct = $orderProduct->wholesalerProduct;

                        $product = Product::where('reference', $wholesalerProduct->reference)
                            ->where('company_id', $delivery->company_id)
                            ->first();

                        if ($product) {
                            $product->stock += $orderProduct->amount;
                            $product->save();
                            $this->info("Sumado {$orderProduct->amount} unidades al producto {$product->label} (ref: {$product->reference}) de la empresa {$delivery->company->name}");
                        } else {
                            Product::create([
                                'company_id'   => $delivery->company_id,
                                'label'        => $wholesalerProduct->name,
                                'reference'    => $wholesalerProduct->reference,
                                'price'        => $wholesalerProduct->price,
                                'stock'        => $orderProduct->amount,
                                'status'       => 'inactive',
                                'description'  => $wholesalerProduct->description,
                                'category_id'  => $wholesalerProduct->category_id,
                                'image'        => $wholesalerProduct->image,
                            ]);
                            $this->info("Creado producto {$wholesalerProduct->name} (ref: {$wholesalerProduct->reference}) para la empresa {$delivery->company->name} con {$orderProduct->amount} unidades.");
                        }
                    }
                }

                $delivery->processed = true;
                $delivery->save();

                $deliveryNote = DeliveryNote::where('order_id', $delivery->order_id)
                    ->where('company_id', $delivery->company_id)
                    ->where('wholesaler_id', $delivery->order->wholesaler_id)
                    ->first();

                if ($deliveryNote) {
                    $deliveryNote->status = 'delivered';
                    $deliveryNote->save();
                }

                $order = $delivery->order;
                if ($order) {
                    $order->status = 'delivered';
                    $order->save();
                }

                DB::commit();
            } catch (\Exception $e) {
                DB::rollBack();
                Log::error("Error processing delivery ID {$delivery->id}: " . $e->getMessage());
                $this->error("Failed to process delivery ID {$delivery->id}: " . $e->getMessage());
            }
        }

        $this->info('Wholesaler deliveries processed successfully!');

        return Command::SUCCESS;
    }
}
