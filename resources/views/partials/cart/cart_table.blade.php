<h2>{{ Cart::count() }} item(s) in Shopping Cart</h2>
<div class="cart-table">
    @foreach(Cart::content() as $item)
        <div class="cart-table-row">
            <div class="cart-table-row-left">
                <a href="{{ route('shop.show', $item->model->slug) }}"><img src="{{ asset('images/products/'.$item->model->slug.'.jpg') }}" alt="item" class="cart-table-img"></a>
                <div class="cart-item-details">
                    <div class="cart-table-item"><a href="{{ route('shop.show', $item->model->slug) }}">{{$item->model->name}}</a></div>
                    <div class="cart-table-description">{{$item->model->details}}</div>
                </div>
            </div>
            <div class="cart-table-row-right">
                <div class="cart-table-actions">
                    <form action="{{ route('cart.destroy', $item->rowId) }}" method="POST">
                        {{ csrf_field() }}
                        {{method_field('DELETE')}}

                        <button type="submit" class="cart-options"> Remove</button>
                    </form>
                    <form action="{{ route('cart.draft', $item->rowId) }}" method="POST">
                        {{ csrf_field() }}
                        <button type="submit" class="cart-options">Save for Later</button>
                    </form>
                </div>
                <div>
                    <select class="quantity" data-id="{{ $item->rowId }}">
                        @for($i = 1; $i <=5; $i++)
                            <option {{ $item->qty == $i ? 'selected' : '' }}>{{$i }}</option>
                        @endfor
                    </select>
                </div>
                <div>{{ productPrice($item->subtotal())}}</div>
            </div>
        </div> <!-- end cart-table-row -->

    @endforeach

</div> <!-- end cart-table -->