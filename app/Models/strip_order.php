<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class strip_order extends Model
{
    protected $table= "orders";
    use HasFactory;
    public function order_with_user()
    {
        return $this->hasOne(User::class,'id','user_id');
    }
    public function order_with_comp()
    {
        return $this->hasOne(CompetitionModel::class,'id','competition_name');
    }
}
