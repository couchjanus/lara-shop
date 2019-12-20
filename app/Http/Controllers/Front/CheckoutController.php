<?php

namespace App\Http\Controllers\Front;

use Cart;
use App\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Contracts\OrderContract;

class CheckoutController extends Controller
{
    protected $orderRepository;

    public function __construct(OrderContract $orderRepository, PayPalService $payPal)
    {
        $this->payPal = $payPal;
        $this->orderRepository = $orderRepository;
    }


    public function getCheckout()
    {
        return view('front.pages.checkout');
    }

    public function placeOrder(Request $request)
    {
        $order = $this->orderRepository->storeOrderDetails($request->all());

        // You can add more control here to handle if the order is not stored properly
        // if ($order) {
        //     $this->payPal->processPayment($order);
        // }

        return redirect()->back()->with('message','Order not placed');
    }

    public function complete(Request $request)
    {
        $paymentId = $request->input('paymentId');
        $payerId = $request->input('PayerID');

        // $status = $this->payPal->completePayment($paymentId, $payerId);

        $order = Order::where('order_number', $status['invoiceId'])->first();
        $order->status = 'processing';
        $order->payment_status = 1;
        // $order->payment_method = 'PayPal -'.$status['salesId'];
        $order->save();

        Cart::clear();
        return view('site.pages.success', compact('order'));
    }
}
