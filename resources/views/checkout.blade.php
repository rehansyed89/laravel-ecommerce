@extends('layout')

@section('title', 'Cart')

@include('partials.nav')

@section('content')
    <div class="container">

        @include('partials.messages')

        <h1 class="checkout-heading stylish-heading">Checkout</h1>
        <div class="checkout-section">
            <div>
                {{-- Section : payment form --}}
                @include('partials.checkout.payment_form')
            </div>



            <div class="checkout-table-container">
                <h2>Your Order</h2>

                <!-- Section : checkout-table -->
                @include('partials.checkout.order_table')

                <!-- Section : checkout-totals -->
                @include('partials.checkout.order_totals')

            </div>

        </div> <!-- end checkout-section -->
    </div>
@endsection