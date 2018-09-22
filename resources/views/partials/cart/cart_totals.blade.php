<div class="cart-totals-right">
    <div>
        Subtotal <br>
        @if(session()->has('coupon'))
            Discount ({{ session()->get('coupon')['coupon_code'] }})
            <form action="{{ route('coupon.destroy') }}" method="post" style="display:block">
                {{csrf_field()}}
                {{method_field('delete')}}
                <button type="submit" style="font-size:14px;">Remove</button>
            </form>
            <hr>
            New Subtotal <br>
        @endif
        Tax (20%)<br>
        <span class="cart-totals-total">Total</span>
    </div>
    <div class="cart-totals-subtotal">
        {{ productPrice(Cart::subtotal()) }} <br>
        @if(session()->has('coupon'))
            - {{ productPrice($discount) }} <br><br>
            <hr>
            {{ productPrice($subTotal) }}<br>
        @endif
        {{ productPrice($tax) }} <br>
        <span class="cart-totals-total">{{ productPrice($total) }}</span>
    </div>
</div> <!-- end cart-totals -->