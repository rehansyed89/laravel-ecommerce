@extends('layout')

@section('title', $product->name)

@include('partials.nav')

@section('content')

    @component('components.breadcrumbs')
        <a href="/">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <a href="{{ route('shop.index') }}">Shop</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span>{{ $product->name }}</span>
    @endcomponent

    <div class="product-section container">
        <div>
            <div class="product-section-image">
                <img src="{{ productImage($product->image) }}" alt="{{ $product->name }}" class="active" id="currentImage">
            </div>
            <div class="product-section-images">
                    <div class="product-section-thumbnail selected">
                        <img src="{{ productImage($product->image) }}" alt="products">
                    </div>
                    @if($product->images)
                        @foreach(json_decode($product->images,true) as $image)
                            <div class="product-section-thumbnail" >
                                <img src="{{ productImage($image) }}" alt="products">
                            </div>
                        @endforeach
                    @endif
            </div>

        </div>
        <div class="product-section-information">
            <h1 class="product-section-title">{{ $product->name }}</h1>
            <div class="product-section-subtitle">{{ $product->detail }}</div>
            <div class="product-section-price">{{ $product->productPrice() }}</div>
            <p> {!! $product->description !!} </p>

            <p>&nbsp;</p>

            {{--<a href="#"><button type="submit" class="button button-plain">Add to Cart</button></a>--}}
            <form action="{{ route('cart.store') }}" method="post">
                {{ csrf_field() }}
                <input type="hidden" name="id" value="{{ $product->id }}">
                <input type="hidden" name="name" value="{{ $product->name }}">
                <input type="hidden" name="price" value="{{ $product->price }}">
                <button type="submit" class="button button-plain">Add to Cart</button>

            </form>
        </div>
    </div> <!-- end product-section -->

    @include('partials.recommended-products')
@endsection

@section('extra-js')
    <script>
        (function(){
            const currentImage = document.querySelector('#currentImage');
            const thumbnailImages = document.querySelectorAll('.product-section-thumbnail');

            thumbnailImages.forEach((el) => el.addEventListener('click', thumbnailClick));

            function thumbnailClick(e){

                currentImage.classList.remove('active');
                currentImage.addEventListener('transitionend', () => {
                    currentImage.src = this.querySelector('img').src;
                    currentImage.classList.add('active');
                })

                thumbnailImages.forEach((el) => el.classList.remove('selected'));
                this.classList.add('selected');
            }

        })();
    </script>

@endsection