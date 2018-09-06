@extends('layout')

@section('title', 'Ecommerce')

@section('content')
<header class="with-background">
    <div class="top-nav container">
        <div class="top-nav-left">
            <div class="logo">Ecommerce</div>
        </div>
        <div class="top-nav-right">
            <ul>
                <li>
                    <a href="#">Shop</a>
                    <a href="#">About</a>
                    <a href="#">Blog</a>
                    <a href="#">Cart</a>
                </li>
            </ul>
        </div>
    </div> <!--end top-nav-->

    <div class="hero container">
        <div class="hero-copy">
            <h1> Ecommerce - Kapray</h1>
            <p>We sell all kinds of stitched and unstitched cloths. Buy some stuff! </p>
            <div class="hero-buttons">
                <a href="#" class="button button-white">Button 1</a>
                <a href="#" class="button button-white">Button 2</a>
            </div>
        </div><!--end hero-copy-->

        <div class="hero-image">
            <img src="images/macbook-pro-laravel.png" alt="hero-image">
        </div><!--end hero-image-->
    </div><!--end hero-->

</header>

<div class="featured-section">
    <div class="container">
        <h1 class="text-center">The Ecommerce</h1>
        <p class="section-description">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam sit amet augue non ipsum tristique tempor. Nulla facilisi. Duis sodales sapien sit amet elementum rutrum. Proin vestibulum orci urna, ac lacinia nunc porta nec. Vivamus sed ligula vitae justo aliquam imperdiet eget ut magna. Nam venenatis, sem ac imperdiet mollis, orci sem dapibus urna, sed viverra tortor quam et felis. Duis ultrices molestie nunc, non ultrices velit sodales nec. Aliquam dignissim sollicitudin turpis sagittis cursus.
        </p>

        <div class="text-center button-container">
            <a href="#" class="button">Featured</a>
            <a href="#" class="button">On sale</a>
        </div>

        <!--CSS Grid Area-->
        <div class="products text-center">
            @foreach($products as $product)
                <div class="product">
                    <a href="#"><img src="images/macbook-pro.png" alt="product"></a>
                    <div class="priduct-name">{{ $product->name }}</div>
                    <div class="priduct-price">{{ $product->productPrice() }}</div>
                </div><!--end product-->
            @endforeach

        </div><!--end products-->

        <div class="text-center button-container">
            <a href="#" class="button">View more products</a>
        </div>

    </div><!--end container-->

</div><!--end featured-section-->

@include('partials.blog')

@endsection