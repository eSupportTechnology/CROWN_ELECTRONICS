<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Inquiry extends Model
{
    use HasFactory;
    protected $table = 'inquiries';

    protected $fillable = [
        'full_name', 'email', 'phone', 'subject', 'message', 'reply', 'status',
    ];
}
