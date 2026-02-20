<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class DeliveryNote extends Model
{
    protected $guarded = [];
    
    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'issue_date' => 'date',
        'delivery_date' => 'date',
    ];
    
    /**
     * Get the order associated with this delivery note
     */
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
    
    /**
     * Get the company (buyer) associated with this delivery note
     */
    public function company()
    {
        return $this->belongsTo(Company::class)->withDefault([
            'name' => 'Empresa no disponible',
            'address' => 'Dirección no disponible',
            'cif' => 'CIF no disponible'
        ]);
    }
    
    /**
     * Get the wholesaler associated with this delivery note
     */
    public function wholesaler()
    {
        return $this->belongsTo(Wholesaler::class)->withDefault([
            'name' => 'Mayorista no disponible',
            'address' => 'Dirección no disponible',
            'cif' => 'CIF no disponible'
        ]);
    }
    
    /**
     * Generate a unique delivery note number
     * 
     * @param int $wholesalerId
     * @param int $orderId
     * @return string
     */
    public static function generateNumber($wholesalerId, $orderId)
    {
        $prefix = 'ALB';
        $date = now()->format('Ymd');
        $random = strtoupper(substr(md5(uniqid()), 0, 4));
        
        return "{$prefix}-{$wholesalerId}-{$orderId}-{$date}-{$random}";
    }
}
