@extends('layout')

@section('title', 'Login')

@include('partials.nav')

@section('content')
<div class="container">
    <div class="auth-pages">
        <div class="auth-left">
            @include('partials.messages')
            <h2>Returning Customer</h2>
            <div class="spacer"></div>
            <form action="{{ route('login') }}" method="POST">
                {{ csrf_field() }}
                <input type="email" id="email" name="email" value="{{ old('email') }}" placeholder="Email" required autofocus>
                <input type="password" id="password" name="password" value="{{ old('password') }}" placeholder="Password" required autofocus>

                <div class="login-container">
                    <button type="submit" class="auth-button">Login</button>
                    <label for="remember">
                        <input type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>
                        Remember Me
                    </label>
                </div>
                <div class="spacer"></div>
                <a href="{{ route('password.request') }}"> Forgot Your Password?</a>
            </form>
        </div><!--End auth-left-->

        <div class="auth-right">

            <h2>New Customer</h2>
            <div class="spacer"></div>
            <p><strong>Save time now.</strong></p>
            <p>You don't need an account to checkout.</p>
            <div class="spacer"></div>
            <a href="#" class="auth-button-hollow">Continue as guest</a>
            <div class="spacer"></div>
            &nbsp;
            <div class="spacer"></div>
            <p><strong>Save time later.</strong></p>
            <p>Create an account for fast checkout and easy access to order history.</p>
            <div class="spacer"></div>
            <a href="{{ route('register') }}" class="auth-button-hollow">Create Account</a>

        </div><!--End auth-right-->

    </div><!--End auth-pages-->
</div>
@endsection
