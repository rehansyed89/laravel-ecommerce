<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public function productPrice(){
        $money_format = new \NumberFormatter('fr_FR', \NumberFormatter::CURRENCY);
        return $money_format->formatCurrency($this->price / 100, 'EUR');
    }

    public function scopeRecommendedProducts($query){
        return $query->inRandomOrder()->take(4);
    }
}
