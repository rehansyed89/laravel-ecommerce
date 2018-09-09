<div class="checkout-table">
    @foreach (Cart::content() as $item)
        <div class="checkout-table-row">
            <div class="checkout-table-row-left">
                <img src="{{ asset('images/products/'.$item->model->slug.'.jpg') }}" alt="item" class="checkout-table-img">
                <div class="checkout-item-details">
                    <div class="checkout-table-item">{{ $item->model->name }}</div>
                    <div class="checkout-table-description">{{ $item->model->details }}</div>
                    <div class="checkout-table-price">{{ $item->model->productPrice() }}</div>
                </div>
            </div> <!-- end checkout-table -->

            <div class="checkout-table-row-right">
                <div class="checkout-table-quantity">{{ $item->qty }}</div>
            </div>
        </div> <!-- end checkout-table-row -->
    @endforeach

</div> <!-- end checkout-table -->