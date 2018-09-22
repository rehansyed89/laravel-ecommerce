<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CouponsController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){
        $coupon = Coupon::findByCode($request->coupon_code)->first();

        if(!$coupon){
            return redirect()->route('cart.index')->withErrors('Invalid coupon code.');
        }

        session()->put('coupon', [
            'coupon_code' => $coupon->code,
            'coupon_discount' => $coupon->getDiscount(Cart::subtotal()),
        ]);

        return redirect()->route('cart.index')->with('success_message', 'Coupon has been applied!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy()
    {
        session()->forget('coupon');

        return redirect()->route('cart.index')->with('success_message', 'Coupon has been removed!');
    }
}
