<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Category;

class FrontController extends Controller
{

    // public function treeList()
    // {
    //     return Category::orderByRaw('-name ASC')
    //         ->get()
    //         ->nest()
    //         ->setIndent('|–– ')
    //         ->listsFlattened('name');
    // }

    public function index()
    {
        // $categories = Category::orderBy('parent_id')->get()->nest();
        
        // $categories = Category::orderBy('name', 'desc')
        // ->get()
        // ->nest()
        // ->setIndent('|–– ')
        // ->listsFlattened('name');
        // dd($categories);
        // $pageTitle = 'Categories';
        // $subTitle = 'List of all categories';
        return view('front.pages.index');
    }
}
