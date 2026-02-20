<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WholesalerSector extends Model
{
    protected $table = 'wholesaler_sector';
    protected $fillable = ['sector_name'];

    public function wholesalers()
    {
        return $this->hasMany(Wholesaler::class, 'sector_id');
    }
}
