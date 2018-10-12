<header>
    <div class="top-nav container">
        <div class="top-nav-left">
            <div class="logo">Ecommerce</div>
            <!--Main menu -->
            {{ menu('main', 'partials.menus.main') }}
        </div>
        <div class="top-nav-right">
            @include('partials.menus.main-right')
        </div>
    </div> <!-- end top-nav -->
</header>
