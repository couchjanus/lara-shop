<?php

Route::namespace('Admin')
    ->prefix('admin')
    ->as('admin.')
	->group(function () {
        Route::get('/', function () {
            return view('admin.dashboard.index');
        })->name('dashboard'); 

        Route::get('/settings', 'SettingController@index')->name('settings');
        Route::post('/settings', 'SettingController@update')->name('settings.update');

        Route::resource('categories', 'CategoryController');
        Route::resource('brands', 'BrandController');
        
        
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

        // Route::resource('attributes', 'AttributeController');
        
        Route::resource('products', 'ProductController');
        Route::post('products/images/upload', 'ProductImageController@upload')->name('products.images.upload');
        Route::get('products/images/{id}/delete', 'ProductImageController@destroy')->name('products.images.delete');

        Route::group(['prefix' => 'orders'], function () {
            Route::get('/', 'OrderController@index')->name('orders.index');
            Route::get('/{order}/show', 'OrderController@show')->name('orders.show');
        });
});
