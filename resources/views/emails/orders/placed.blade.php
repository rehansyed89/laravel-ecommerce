@component('mail::message')
# Order Received

Thank you for your order.

**Order ID:** {{ $order->id }}

**Order Email:** {{ $order->billing_email }}

**Order Name:** {{ $order->billing_name }}



**Order Total:** {{ number_format(round($order->billing_total / 100, 2), 2, ',', '') }} €

**Items Ordered**

@foreach ($order->products as $product)
{{-- @component('mail::product_details', [
		'src' => productImage($product->image),
		'name' => $product->name, 
		'price' => number_format(round($product->price / 100, 2), 2, ',', ''), 
		'quantity' => $product->pivot->quantity,
		'url' => $product->slug,
	])
@endcomponent --}}
Name: {{ $product->name }} <br>
Price: ${{ round($product->price / 100, 2)}} <br>
Quantity: {{ $product->pivot->quantity }} <br>
@endforeach
<br><br>
You can get further details about your order by logging into our website.

@component('mail::button', ['url' => config('app.url'), 'color' => 'green'])
Go to Website
@endcomponent

Thank you again for choosing us.

Regards,<br>
{{ config('app.name') }}
@endcomponent
