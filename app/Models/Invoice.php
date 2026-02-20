<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $guarded = [];
    
    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'issue_date' => 'date',
    ];
    
    /**
     * Get the order associated with this invoice
     */
    public function order()
    {
        return $this->belongsTo(Order::class);
    }
    
    /**
     * Get the company (buyer) associated with this invoice
     */
    public function company()
    {
        return $this->belongsTo(Company::class);
    }
    
    /**
     * Get the wholesaler associated with this invoice
     */
    public function wholesaler()
    {
        return $this->belongsTo(Wholesaler::class);
    }
    
    /**
     * Generate a unique invoice number
     * 
     * @param int $wholesalerId
     * @param int $orderId
     * @return string
     */
    public static function generateNumber($wholesalerId, $orderId)
    {
        $prefix = 'FACT';
        $year = now()->format('Y');
        $date = now()->format('md');
        $random = strtoupper(substr(md5(uniqid()), 0, 4));
        
        return "{$prefix}/{$year}/{$wholesalerId}-{$orderId}-{$date}-{$random}";
    }
}
 