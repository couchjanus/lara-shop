<?php

Route::namespace('Admin')
    ->prefix('admin')
    ->as('admin.')
	->group(function () {
        Route::get('/', function () {
            return view('admin.dashboard.index');
        })->name('dashboard'); 
        Route::resource('categories', 'CategoryController');
});
