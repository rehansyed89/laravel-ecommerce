<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Coupon extends Model
{
    public static function findByCode($code)
    {
        return self::where('code', $code);
    }

    public function getDiscount($total){
        if($this->type == 'fixed'){
            return $this->value;
        }elseif($this->type == 'percent'){
            return round(($this->percent_off / 100) * $total);
        }else{
            return 0;
        }
    }
}