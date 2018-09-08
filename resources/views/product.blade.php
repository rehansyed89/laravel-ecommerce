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
        <div class="product-section-image">
            <img src="{{ asset('images/products/'.$product->slug.'.jpg') }}" alt="product" class="active" id="currentImage">
        </div>
        <div class="product-section-information">
            <h1 class="product-section-title">{{ $product->name }}</h1>
            <div class="product-section-subtitle">{{ $product->detail }}</div>
            <div class="product-section-price">{{ $product->productPrice() }}</div>
            <p> {{ $product->description }} </p>

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
