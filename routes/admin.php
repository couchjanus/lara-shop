<?php

Route::namespace('Admin')
    ->prefix('admin')
    ->as('admin.')
	->group(function () {
        Route::get('/', function () {
            return view('admin.dashboard.index');
        })->name('dashboard'); 
        Route::resource('categories', 'CategoryController');
        Route::resource('brands', 'BrandController');
        Route::resource('attributes', 'AttributeController');
        Route::resource('products', 'ProductController');
        Route::post('products/images/upload', 'ProductImageController@upload')->name('products.images.upload');
        Route::get('products/images/{id}/delete', 'ProductImageController@destroy')->name('products.images.delete');
});
