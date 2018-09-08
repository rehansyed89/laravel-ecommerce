<div class="might-like-section">
    <div class="container">
        <h2>You might also like...</h2>
        <div class="might-like-grid">
            @foreach($recommendedProducts as $product)
                <a href="{{ route('shop.show',$product->slug) }}" class="might-like-product">
                    <img src="{{ asset('images/products/'.$product->slug.'.jpg') }}" alt="product">
                    <div class="might-like-product-name">{{ $product->name }}</div>
                    <div class="might-like-product-price">{{ $product->productPrice() }}</div>
                </a>
            @endforeach
        </div>
    </div>
</div>