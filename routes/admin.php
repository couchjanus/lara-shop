<?php

Route::namespace('Admin')
    ->prefix('admin')
    ->as('admin.')
	->group(function () {
        
        Route::get('login', 'LoginController@showLoginForm')->name('login');
        Route::post('login', 'LoginController@login')->name('login.post');
        Route::get('logout', 'LoginController@logout')->name('logout');

        Route::group(['middleware' => ['auth:admin']], function () {


        Route::get('/', function () {
            return view('admin.dashboard.index');
        })->name('dashboard'); 

        Route::get('/settings', 'SettingController@index')->name('settings');
        Route::post('/settings', 'SettingController@update')->name('settings.update');

        Route::resource('categories', 'CategoryController');
        // Route::resource('brands', 'BrandController');

        Route::group(['prefix'  =>   'brands'], function() {

            Route::get('/', 'BrandController@index')->name('brands.index');
            Route::get('/create', 'BrandController@create')->name('brands.create');
            Route::post('/store', 'BrandController@store')->name('brands.store');
            Route::get('/{id}/edit', 'BrandController@edit')->name('brands.edit');
            Route::post('/update', 'BrandController@update')->name('brands.update');
            Route::get('/{id}/delete', 'BrandController@delete')->name('brands.destroy');
        });
        
        Route::group(['prefix' => 'attributes'], function() {
            Route::get('/', 'AttributeController@index')->name('attributes.index');
            Route::get('/create', 'AttributeController@create')->name('attributes.create');
            Route::post('/store', 'AttributeController@store')->name('attributes.store');
            Route::get('/{id}/edit', 'AttributeController@edit')->name('attributes.edit');
            Route::post('/update', 'AttributeController@update')->name('attributes.update');
            Route::get('/{id}/delete', 'AttributeController@delete')->name('attributes.destroy');

            Route::post('/get-values', 'AttributeValueController@getValues');
            Route::post('/add-values', 'AttributeValueController@addValues');
            Route::post('/update-values', 'AttributeValueController@updateValues');
            Route::post('/delete-values', 'AttributeValueController@deleteValues');
        });
        
        // Route::resource('products', 'ProductController');
        

        Route::group(['prefix' => 'products'], function() {

           Route::get('/', 'ProductController@index')->name('products.index');
           Route::get('/create', 'ProductController@create')->name('products.create');
           Route::post('/store', 'ProductController@store')->name('products.store');
           Route::get('/edit/{id}', 'ProductController@edit')->name('products.edit');
           Route::post('/update', 'ProductController@update')->name('products.update');

           Route::get('/{id}/delete', 'ProductController@delete')->name('products.destroy');

            Route::post('images/upload', 'ProductImageController@upload')->name('products.images.upload');
            Route::get('images/{id}/delete', 'ProductImageController@destroy')->name('products.images.delete');

            Route::get('attributes/load', 'ProductAttributeController@loadAttributes');
            Route::post('attributes', 'ProductAttributeController@productAttributes');
            Route::post('attributes/values', 'ProductAttributeController@loadValues');
            Route::post('attributes/add', 'ProductAttributeController@addAttribute');
            Route::post('attributes/delete', 'ProductAttributeController@deleteAttribute');

        });


        Route::group(['prefix' => 'orders'], function () {
            Route::get('/', 'OrderController@index')->name('orders.index');
            Route::get('/{order}/show', 'OrderController@show')->name('orders.show');
        });
    });
});
