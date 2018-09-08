@extends('layout')

@section('title', 'Shop')

@include('partials.nav')

@section('content')

    @component('components.breadcrumbs')
        <a href="/">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <a href="{{ route('shop.index') }}">Shop</a>
    @endcomponent

    <div class="products-section container">
        <div class="sidebar">
            <h3>By Category</h3>
            <ul>
                <li><a href="#">Laptops</a></li>
                <li><a href="#">Desktops</a></li>
                <li><a href="#">Mobile Phones</a></li>
                <li><a href="#">Tablets</a></li>
                <li><a href="#">Tvs</a></li>
                <li><a href="#">Digital Cameras</a></li>
                <li><a href="#">Ampliances</a></li>
            </ul>

            <h3>By Price</h3>
            <ul>
                <li><a href="#">200€ - 700€</a></li>
                <li><a href="#">701€ - 1500€</a></li>
                <li><a href="#">1501€ - 3000€</a></li>
            </ul>
        </div> <!-- end sidebar -->
        <div>
            <h1 class="stylish-heading">Laptops</h1>
            <div class="products text-center">
                @foreach($products as $product)
                    <div class="product">
                        <a href="{{route('shop.show', $product->slug)}}"><img src="{{ asset('images/products/'.$product->slug.'.jpg') }}" alt="product"></a>
                        <a href="{{route('shop.show', $product->slug)}}"><div class="product-name">{{ $product->name }}</div></a>
                        <div class="product-price">{{ $product->productPrice() }}</div>
                    </div>
                 @endforeach
            </div> <!-- end products -->
        </div>
    </div>

@endsection