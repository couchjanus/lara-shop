<?php

// Route::get('/', 'FrontController@index');

Route::view('/', 'front.pages.index');
Route::get('/category/{slug}', 'Front\CategoryController@show')->name('category.show');
Route::get('/product/{slug}', 'Front\ProductController@show')->name('product.show');



Route::post('/product/add/cart', 'Front\ProductController@addToCart')->name('product.add.cart');
Route::get('/cart', 'Front\CartController@getCart')->name('checkout.cart');
Route::get('/cart/item/{id}/remove', 'Front\CartController@removeItem')->name('checkout.cart.remove');
Route::get('/cart/clear', 'Front\CartController@clearCart')->name('checkout.cart.clear');


Route::group(['middleware' => ['auth']], function () {
    Route::get('/checkout', 'Front\CheckoutController@getCheckout')->name('checkout.index');
    Route::post('/checkout/order', 'Front\CheckoutController@placeOrder')->name('checkout.place.order');

    Route::get('checkout/payment/complete', 'Front\CheckoutController@complete')->name('checkout.payment.complete');

    Route::get('account/orders', 'Front\AccountController@getOrders')->name('account.orders');
});


require 'admin.php';
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
