<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $recommendedProducts = Product::recommendedProducts()->get();
        return view('cart',[
        'recommendedProducts' =>$recommendedProducts
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        /* $duplicates to find if the item is already in the cart or not?*/
        $duplicates = Cart::search(function($cartItem, $rowId) use ($request){
           return $cartItem->id === $request->id;
        });

        if($duplicates->isNotEmpty()){
            return redirect()->route('cart.index')->with('success_message', 'Item is already in your cart!');
        }

        Cart::add($request->id, $request->name, 1, $request->price)
            ->associate('App\Models\Product');

        return redirect()->route('cart.index')->with('success_message', 'Item added to the cart');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(),[
            'quantity' => 'required|numeric|between:1,5'
        ]);

        if($validator->fails()){
            session()->flash('errors', collect(['Quantity must be between 1 and 5.']));
            return response()->json(['success' => false], 400);
        }

        Cart::update($id, $request->quantity);

        session()->flash('success_message', 'Quantity was updated successfully!');
        $totalQuantities = $request->quantity;
        $pricePerItem = Cart::get($id)->price;
        $updatedPrice = $pricePerItem * $totalQuantities;

        return response()->json([
            'success' => true ,
            'itemPrice' => productPrice($updatedPrice),
            'tax' => productPrice(Cart::tax()),
            'sutotal' => productPrice(Cart::subtotal()),
            'total' => productPrice(Cart::total())
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Cart::remove($id);

        return back()->with('success_message','Item has been removed!');
    }

    /**
     * Switch items in shopping cart to save for later.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function cartToDraft($id)
    {
        $item = Cart::get($id);

        Cart::remove($id);

        $duplicates = Cart::instance('saveForLater')->search(function($cartItem, $rowId) use ($id){
            return $rowId === $id;
        });

        if($duplicates->isNotEmpty()){
            return redirect()->route('cart.index')->with('success_message', 'Item is already Saved For Later!');
        }

        Cart::instance('saveForLater')->add($item->id,$item->name,1,$item->price)->associate('App\Models\Product');

        return redirect()->route('cart.index')->with('success_message','Item has been Saved For Later!');

    }
}
