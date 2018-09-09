<?php


function productPrice($price){
    $money_format = new \NumberFormatter('fr_FR', \NumberFormatter::CURRENCY);
    return $money_format->formatCurrency($price / 100, 'EUR');
}