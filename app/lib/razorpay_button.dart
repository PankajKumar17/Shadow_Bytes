import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RazorpayButton extends StatefulWidget {
  final int amount; // Amount in paise (₹ * 100)
  final Function(double) onPaymentSuccess;

  const RazorpayButton({
    Key? key,
    required this.amount,
    required this.onPaymentSuccess,
  }) : super(key: key);

  @override
  _RazorpayButtonState createState() => _RazorpayButtonState();
}

class _RazorpayButtonState extends State<RazorpayButton> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "Payment Successful");
    widget.onPaymentSuccess(widget.amount.toDouble());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed: ${response.message}");
  }

  void _startPayment() {
    if (widget.amount <= 0) {
      Fluttertoast.showToast(msg: "Invalid amount");
      return;
    }

    var options = {
      'key': 'rzp_test_CqRTfRAgxPxCv1',
      'amount': widget.amount, // Razorpay requires amount in paise
      'name': 'Smart Checkout',
      'description': 'Wallet Top-up',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com'
      }
    };

    _razorpay.open(options);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _startPayment,
      child: const Text("Pay with Razorpay"),
    );
  }
}