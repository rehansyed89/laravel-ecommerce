<?php


function productPrice($price){
    $money_format = new \NumberFormatter('fr_FR', \NumberFormatter::CURRENCY);
    return $money_format->formatCurrency($price / 100, 'EUR');
}

function setActiveCategory($category, $class = 'active'){
    return request()->category == $category ? $class : '';
}

function getTotals(){
    $code = session()->get('coupon')['coupon_code'] ?? null;
    $discount = session()->get('coupon')['coupon_discount'] ?? 0;
    $original_tax = config('cart.tax') / 100;
    $subtotal = (Cart::subtotal() - $discount);
    $tax = $subtotal * $original_tax;
    $total = $subtotal + $tax;

    return collect([
        'discount_code' => $code,
        'discount' => $discount,
        'original_tax' => $original_tax,
        'tax' => $tax,
        'subtotal' => $subtotal,
        'total' => $total
    ]);
}

function productImage($path){
    return $path && file_exists('storage/'.$path) ? asset('storage/'.$path) : asset('images/not-found.jpg');
}