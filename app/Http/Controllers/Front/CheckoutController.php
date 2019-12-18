<?php

namespace App\Http\Controllers\Front;

use Cart;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CheckoutController extends Controller
{

    public function getCheckout()
    {
        return view('front.pages.checkout');
    }

    public function placeOrder(Request $request)
    {
       
    }

    public function complete(Request $request)
    {
    }
}
