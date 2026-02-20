<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MailsUser extends Model
{
    use HasFactory, SoftDeletes;

    protected $table = 'mails_users';

    protected $fillable = [
        'message_id',
        'recipient_id',
        'readt_at',
        'onCopy',
    ];

    /**
     * Relación con el modelo Mails
     */
    public function mail()
    {
        return $this->belongsTo(Mail::class, 'message_id');
    }

    /**
     * Relación con el modelo User
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'recipient_id');
    }
}
