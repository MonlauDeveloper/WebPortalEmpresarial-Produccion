<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WholesalerProduct extends Model
{
    use HasFactory;

    protected $guarded = [];

    public $table = "wholesaler_products";

    public function wholesaler()
    {
        return $this->belongsTo(Wholesaler::class);
    }

    public function category()
    {
        return $this->belongsTo(ProductCategory::class, 'category_id');
    }
}