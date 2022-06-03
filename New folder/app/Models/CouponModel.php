<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CouponModel extends Model
{
    protected $table= "coupon_codes";
    use HasFactory;
    public function couponWithComp()
    {
        return $this->hasOne(CompetitionModel::class,'id','competition_id');
    }
}
