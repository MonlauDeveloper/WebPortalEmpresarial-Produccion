<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Mail;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MailAttachment extends Model
{
    use HasFactory;

    protected $fillable = ['mail_id', 'file_name', 'file_path'];

    public function mail()
    {
        return $this->belongsTo(Mail::class);
    }
}
