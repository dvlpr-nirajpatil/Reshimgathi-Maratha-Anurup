import 'dart:convert';
import 'package:http/http.dart' as http;

class RazorpayApis {
  static Future<String?> createRazorpayOrder(amount) async {
    const String apiKey = 'nqK5kfxomEqaaK7qDuotjpDS';
    const String apiId = "rzp_test_aSIgdHeoVYMKRz";

    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$apiId:$apiKey'));
    // Replace with your Razorpay API key
    const String orderIdEndpoint = 'https://api.razorpay.com/v1/orders';

    try {
      // Create a JSON object for the order request
      Map<String, dynamic> orderRequest = {
        "amount": amount, // amount in the smallest currency unit
        "currency": "INR",
        "receipt": 'order_rcptid_11',
      };

      // Convert the order request to a JSON string
      String orderRequestJson = jsonEncode(orderRequest);

      // Make a POST request to create the order
      http.Response response = await http.post(
        Uri.parse(orderIdEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': basicAuth,
        },
        body: orderRequestJson,
      );

      // Check the response status
      if (response.statusCode == 200) {
        // Parse the response JSON
        Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Extract the order ID from the response
        String orderId = responseBody['id'];

        // Now, you can use the orderId as needed
        print('Order ID: $orderId');

        return orderId;
      } else {
        // Handle non-200 response status
        print('Failed to create order. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // Handle exceptions
      print('Exception occurred: $e');
    }

    return null;
  }
}
