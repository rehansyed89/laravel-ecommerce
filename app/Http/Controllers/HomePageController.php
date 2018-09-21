<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class HomePageController extends Controller{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        $products = Product::where('featured', true)->inRandomOrder()->take(8)->get();

        return view('home-page',[
            'products' => $products
        ]);
    }

}
