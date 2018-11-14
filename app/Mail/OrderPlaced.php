<?php

namespace App\Mail;

use App\Models\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderPlaced extends Mailable
{
    use Queueable, SerializesModels;

    public $order;
    public $product_names;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(Order $order, $product_names)
    {
        $this->order = $order;
        $this->product_names = $product_names;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->to($this->order->billing_email, $this->order->billing_name)
                    ->bcc('rehansyed89@gmail.com')
                    ->subject('Confirmation - Votre commande de "'.$this->product_names.'"')
                    ->markdown('emails.orders.placed');
    }
}
