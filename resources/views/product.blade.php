@extends('layout')

@section('title', 'Shop')

@section('extra-css')
    <link rel="stylesheet" href="{{ asset('css/algolia.css') }}">
@endsection

@section('content')

    @component('components.breadcrumbs')
        <a href="/">Home</a>
        <i class="fa fa-chevron-right breadcrumb-separator"></i>
        <span>Laptop</span>
    @endcomponent
    <div class="product-section container">
        <div>
            <div class="product-section-image">
                <img src="images/macbook-pro.png" alt="product" class="active" id="currentImage">
            </div>
            <div class="product-section-images">
                <div class="product-section-thumbnail selected">
                    <img src="images/macbook-pro.png" alt="product">
                </div>

            </div>
        </div>
        <div class="product-section-information">
            <h1 class="product-section-title">Macbook Pro</h1>
            <div class="product-section-subtitle">15 inch 1 TB SSD, 32GB RAM</div>
            <div>5</div>
            <div class="product-section-price">259€</div>
            <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!
            </p>

            <p>&nbsp;</p>

            <form action="#" method="POST">
                {{ csrf_field() }}
                <button type="submit" class="button button-plain">Add to Cart</button>
            </form>

        </div>
    </div> <!-- end product-section -->

@endsection

@section('extra-js')
    <script>
        (function(){
            const currentImage = document.querySelector('#currentImage');
            const images = document.querySelectorAll('.product-section-thumbnail');

            images.forEach((element) => element.addEventListener('click', thumbnailClick));

            function thumbnailClick(e) {
                currentImage.classList.remove('active');

                currentImage.addEventListener('transitionend', () => {
                    currentImage.src = this.querySelector('img').src;
                    currentImage.classList.add('active');
                })

                images.forEach((element) => element.classList.remove('selected'));
                this.classList.add('selected');
            }

        })();
    </script>

    <!-- Include AlgoliaSearch JS Client and autocomplete.js library -->
    <script src="https://cdn.jsdelivr.net/algoliasearch/3/algoliasearch.min.js"></script>
    <script src="https://cdn.jsdelivr.net/autocomplete.js/0/autocomplete.min.js"></script>
    <script src="{{ asset('js/algolia.js') }}"></script>

@endsection
