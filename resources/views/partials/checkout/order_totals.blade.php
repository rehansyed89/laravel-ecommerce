<div class="checkout-totals">
    <div class="checkout-totals-left">
        Subtotal <br>
        TVA (20%) <br>
        <span class="checkout-totals-total">Total</span>

    </div>

    <div class="checkout-totals-right">
        {{ productPrice(getTotals()->get('subtotal')) }} <span style="font-size: 10px; font-weight: bold; font-style: italic">({{ productPrice(Cart::subtotal()) }} - {{ productPrice(session()->get('coupon')['coupon_discount']) }})</span> <br>
        {{ productPrice(getTotals()->get('tax')) }} <br>
        <span class="checkout-totals-total">{{ productPrice(getTotals()->get('total')) }}</span>

    </div>
</div> <!-- end checkout-totals -->