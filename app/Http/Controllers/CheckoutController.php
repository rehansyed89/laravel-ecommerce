<?php

namespace App\Http\Controllers;

use App\Http\Requests\CheckoutRequest;
use App\Mail\OrderPlaced;
use App\Models\Order;
use App\Models\OrderProduct;
use Cartalyst\Stripe\Exception\CardErrorException;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(auth()->user() && request()->is('guestCheckout'))
        {
            return redirect()->route('checkout.index');
        }
        return view('checkout');
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
    public function store(CheckoutRequest $request)
    {
        $product_names = array();
        $contents =Cart::content()->map(function($item){
            return $item->model->slug.', '.$item->qty;
        })->values()->toJson();
        try{
            $charge = Stripe::charges()->create([
                'amount' => getTotals()->get('total') / 100,
                'currency' => 'EUR',
                'source' =>$request->stripeToken,
                'description' => 'Order',
                'receipt_email' => $request->email,
                'metadata' => [
                    'contents' => $contents,
                    'quantity' => Cart::instance('default')->count(),
                    'discount' => collect(session()->get('coupon'))->toJson(),
                ],
            ]);

            // Insert into order table
            $order = $this->addToOrdersTables($request, null);
            
            //get name of each product to add produc names in the subject line of the mail
            foreach ($order->products as $product) {
                array_push($product_names, $product->name);
            }        
            
            // implode the array product names to make a string
            $produuct_name_imploded = implode(", ", $product_names);
            Mail::send(new OrderPlaced($order, $produuct_name_imploded));
            // SUCCESSFUL
            Cart::instance('default')->destroy();
            session()->forget('coupon');
            return redirect()->route('confirmation.index')->with('success_message', 'Thank you! Your payment has been successfully accepted!');
        }catch (CardErrorException $e){
            $this->addToOrdersTables($request, $e->getMessage());
            return back()->withErrors('Error! '.$e->getMessage());
        }

    }

    protected function addToOrdersTables($request, $error)
    {

        $order = Order::create([
            'user_id' => auth()->user() ? auth()->user()->id : null,
            'billing_email' => $request->email,
            'billing_name' => $request->name,
            'billing_address' => $request->address,
            'billing_city' => $request->city,
            'billing_province' => $request->province,
            'billing_postalcode' => $request->postalcode,
            'billing_phone' => $request->phone,
            'billing_name_on_card' => $request->name_on_card,
            'billing_discount' => getTotals()->get('discount'),
            'billing_discount_code' => getTotals()->get('discount_code'),
            'billing_subtotal' => getTotals()->get('subtotal'),
            'billing_tax' => getTotals()->get('tax'),
            'billing_total' => getTotals()->get('total'),
            'error' => $error, 
        ]);

        // insert into order_product table
        foreach (Cart::content() as $item) {
            OrderProduct::create([
                'order_id' => $order->id,
                'product_id' => $item->model->id,
                'quantity' => $item->qty,
            ]);
        }
        
        return $order;    
    }
}
