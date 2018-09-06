@extends('layout')

@section('title', 'Shop')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/algolia.css') }}">
@endsection

@section('content')

    @component('components.breadcrumbs')
        <a href="/">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span>Shop</span>
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
                <div class="product">
                    <a href="#"><img src="/images/macbook-pro.png" alt="product"></a>
                    <a href="#"><div class="product-name">Macbook Pro</div></a>
                    <div class="product-price">259€</div>
                </div>
                <div class="product">
                    <a href="#"><img src="/images/macbook-pro.png" alt="product"></a>
                    <a href="#"><div class="product-name">Macbook Pro</div></a>
                    <div class="product-price">259€</div>
                </div>
                <div class="product">
                    <a href="#"><img src="/images/macbook-pro.png" alt="product"></a>
                    <a href="#"><div class="product-name">Macbook Pro</div></a>
                    <div class="product-price">259€</div>
                </div>
                <div class="product">
                    <a href="#"><img src="/images/macbook-pro.png" alt="product"></a>
                    <a href="#"><div class="product-name">Macbook Pro</div></a>
                    <div class="product-price">259€</div>
                </div>
                <div class="product">
                    <a href="#"><img src="/images/macbook-pro.png" alt="product"></a>
                    <a href="#"><div class="product-name">Macbook Pro</div></a>
                    <div class="product-price">259€</div>
                </div>
                <div class="product">
                    <a href="#"><img src="/images/macbook-pro.png" alt="product"></a>
                    <a href="#"><div class="product-name">Macbook Pro</div></a>
                    <div class="product-price">259€</div>
                </div>
                <div class="product">
                    <a href="#"><img src="/images/macbook-pro.png" alt="product"></a>
                    <a href="#"><div class="product-name">Macbook Pro</div></a>
                    <div class="product-price">259€</div>
                </div>
                <div class="product">
                    <a href="#"><img src="/images/macbook-pro.png" alt="product"></a>
                    <a href="#"><div class="product-name">Macbook Pro</div></a>
                    <div class="product-price">259€</div>
                </div>
            </div> <!-- end products -->

            <div class="spacer"></div>
        </div>
    </div>

    @include('partials.blog')

@endsection

@section('extra-js')
    <!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
    <script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
    <script src="https://cdn.jsdelivr.net/autocomplete.js/0/autocomplete.min.js"></script>
    <script src="{{ asset('js/algolia.js') }}"></script>
@endsection