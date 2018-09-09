<div class="checkout-totals">
    <div class="checkout-totals-left">
        Subtotal <br>
        TVA (20%) <br>
        <span class="checkout-totals-total">Total</span>

    </div>

    <div class="checkout-totals-right">
        {{ productPrice(Cart::subtotal()) }} <br>
        {{ productPrice(Cart::tax()) }} <br>
        <span class="checkout-totals-total">{{ productPrice(Cart::total()) }}</span>

    </div>
</div> <!-- end checkout-totals -->