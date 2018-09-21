<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $pagination = 9;
        $categories = Category::all();
        $categoryName = 'Featured';

        if(request()->category){
            $products = Product::whereHas('categories', function ($q){
                $q->where('slug', request()->category);
            });
            $categoryName = optional(Category::where('slug', request()->category)->first())->name;
        }else{
            $products = Product::where('featured', true);
        }

        if(request()->sort){
            if(request()->sort == 'low_high'){
                $products = $products->OrderBy('price')->paginate($pagination);
            }elseif (request()->sort == 'high_low'){
                $products = $products->OrderBy('price','desc')->paginate($pagination);
            }
        }else{
            $products = $products->paginate(9);
        }
        return view('shop',[
            'products' => $products,
            'categories' => $categories,
            'categoryName' =>$categoryName
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  string  $slug
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $product = Product::where('slug',$slug)->firstOrFail();
        $recommendedProducts = Product::where('slug', '!=', $slug)->recommendedProducts()->get();

        return view('product',[
            'product' => $product,
            'recommendedProducts' =>$recommendedProducts
        ]);
    }

}
