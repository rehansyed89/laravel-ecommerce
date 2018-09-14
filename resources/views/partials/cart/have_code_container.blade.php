<a href="#" class="have-code">Have a Code?</a>

<div class="have-code-container">
    <form action="#" method="POST">
        {{ csrf_field() }}
        <input type="text" name="coupon_code" id="coupon_code">
        <button type="submit" class="button button-plain">Apply</button>
    </form>
</div> <!-- end have-code-container -->