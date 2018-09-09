<div class="cart-totals">
    <div class="cart-totals-left">
        Shipping is free because we’re awesome like that. Also because that’s additional stuff I don’t feel like figuring out :).
    </div>

    <div class="cart-totals-right">
        <div>
            Subtotal <br>
            TVA (20%) <br>
            <span class="cart-totals-total">Total</span>
        </div>
        <div class="cart-totals-subtotal">
            {{ productPrice(Cart::subtotal()) }} <br>
            {{ productPrice(Cart::tax()) }} <br>
            <span class="cart-totals-total">{{ productPrice(Cart::total()) }}</span>
        </div>
    </div>
</div> <!-- end cart-totals -->