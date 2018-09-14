@if(Cart::instance('saveForLater')->count() > 0)
    <h2>{{ Cart::instance('saveForLater')->count() }} item(s) Saved For Later</h2>

    <div class="saved-for-later cart-table">
        @foreach(Cart::instance('saveForLater')->content() as $item)
            <div class="cart-table-row">
                <div class="cart-table-row-left">
                    <a href="{{route('shop.show', $item->model->slug)}}"><img src="{{ asset('images/products/'.$item->model->slug.'.jpg') }}" alt="item" class="cart-table-img"></a>
                    <div class="cart-item-details">
                        <div class="cart-table-item"><a href="{{route('shop.show', $item->model->slug)}}">{{ $item->model->name }}</a></div>
                        <div class="cart-table-description">{{ $item->model->details }}</div>
                    </div>
                </div>
                <div class="cart-table-row-right">
                    <div class="cart-table-actions">
                        <form action="{{route('saveForLater.destroy',$item->rowId)}}" method="POST">
                            {{ csrf_field() }}
                            {{ method_field('DELETE') }}

                            <button type="submit" class="cart-options">Remove</button>
                        </form>

                        <form action="{{route('saveForLater.draft_to_cart',$item->rowId)}}" method="POST">
                            {{ csrf_field() }}
                            <button type="submit" class="cart-options">Move to Cart</button>
                        </form>
                    </div>

                    <div>{{ $item->model->productPrice() }}</div>
                </div>
            </div> <!-- end cart-table-row -->

         @endforeach
    </div> <!-- end saved-for-later -->
@else
    <h3>You have no items Saved for Later.</h3>
@endif