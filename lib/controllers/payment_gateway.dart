import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/requests/payment_apis.dart';

class PaymentGatewayController extends ChangeNotifier {
  String _apiKey = "nqK5kfxomEqaaK7qDuotjpDS'";

  Future<Map<String, dynamic>> createPaymentOrder(amount) async {
    String id = await RazorpayApis.createRazorpayOrder(amount) ?? "";

    Map<String, dynamic> options = {
      "key": _apiKey,
      "order_id": id,
      "customer_id": FirebaseAuth.instance.currentUser!.uid,
      "prefill": {
        "contact": "+919000090000",
        "email": "gaurav.kumar@example.com",
      },
      "amount": amount, // Amount should match the order amount
      "currency": "INR",
      "recurring":
          1, // This key-value pair is mandatory for Intent Recurring Payment.
    };

    return options;
  }
}
