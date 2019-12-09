<?php

namespace App\Providers;

use App\Category;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ViewComposerServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        View::composer('front.partials.nav', function ($view) {
            // ini_set('max_execution_time', 120);
            
            $view->with('categories', Category::orderBy('name', 'asc')->get()->toTree());
        });
    }
}
