<?php

// Route::get('/', 'FrontController@index');

Route::view('/', 'front.pages.index');
Route::get('/category/{slug}', 'Front\CategoryController@show')->name('category.show');
Route::get('/product/{slug}', 'Front\ProductController@show')->name('product.show');

require 'admin.php';
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
