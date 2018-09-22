@extends('layout')

@section('title', 'Cart')

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
                @if(!session()->has('coupon'))
                    @include('partials.cart.have_code_container')
                @endif

                <!-- Section : cart_totals -->
                <div class="cart-totals">
                    <div class="cart-totals-left">
                        Shipping is free because we’re awesome like that. Also because that’s additional stuff I don’t feel like figuring out :).
                    </div>
                    @include('partials.cart.cart_totals')
                </div>

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

@section('extra-js')
    <script src="{{ asset('js/app.js') }}"></script>
    <script>
        (function () {
            const classname = document.querySelectorAll('.quantity');

            Array.from(classname).forEach(function (element) {
                element.addEventListener('change',function () {
                    const productId = element.getAttribute('data-id');
                    axios.patch(`/cart/${productId}`,{
                        quantity : this.value
                    })
                        .then(function(response){
                            //console.log(response.data.itemPrice)
                            window.location.href = '{{ route('cart.index') }}'
                        })
                        .catch(function(error){
                            //console.log(error)
                            window.location.href = '{{ route('cart.index') }}'
                        });
                })
            })

        })();
    </script>
@endsection