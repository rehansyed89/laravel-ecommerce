@extends('layout')

@section('title', 'Cart')

@include('partials.nav')

@section('content')
    @component('components.breadcrumbs')
        <a href="/">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <a href="{{ route('cart.index') }}">Shopping Cart</a>
    @endcomponent

    <div class="cart-section container">
        <div>
            @include('partials.messages')

            @if(Cart::count() >0)

                <!-- Section : cart_table -->
                @include('partials.cart.cart_table')

                <!-- Section : have_code_container -->
                @include('partials.cart.have_code_container')

                <!-- Section : cart_totals -->
                @include('partials.cart.cart_totals')

                <div class="cart-buttons">
                    <a href="{{ route('shop.index') }}" class="button">Continue Shopping</a>
                    <a href="{{ route('checkout.index') }}" class="button-primary">Proceed to Checkout</a>
                </div>

            @else
                <h3>No items in Cart!</h3>
                <div class="spacer"></div>
                <a href="{{ route('shop.index') }}" class="button">Continue Shopping</a>
                <div class="spacer"></div>
            @endif

            <!-- Section : savd-for-later -->
            @include('partials.cart.save_for_later')
        </div>

    </div> <!-- end cart-section -->

    @include('partials.recommended-products')
@endsection
