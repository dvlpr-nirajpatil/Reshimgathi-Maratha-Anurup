import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/payment_gateway.dart';
import 'package:reshimgathi/services/store_user_data.dart';

class MembershipScreen extends StatefulWidget {
  MembershipScreen({super.key});

  static const String id = "membership";

  @override
  State<MembershipScreen> createState() => _MembershipScreenState();
}

class _MembershipScreenState extends State<MembershipScreen> {
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds
    await UserRegistrationApi.verifyUser(response.paymentId, response.orderId);
    Get.offAll(() => Home());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Errror");
    // Do something when payment fails
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    print("error");
  }

  void openCheckOut(amount) async {
    amount = amount * 100;
    var options = {
      'key': 'rzp_test_aSIgdHeoVYMKRz',
      'amount': amount,
      'name': 'Reshimgathi',
      'prefill': {
        'contact': '8694886749',
        'email': 'probity@gmail.com',
      },
      'external': {
        'wallet': [
          'paytm',
        ]
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<PaymentGatewayController>(context, listen: false);
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        padding: screenPadding.copyWith(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                "₹".text.size(18).make(),
                5.widthBox,
                "2000/Year".text.size(24).fontFamily(semiBold).make(),
              ],
            ),
            10.heightBox,
            FilledButton(
                onPressed: () {
                  openCheckOut(2000);
                },
                child: "Subscribe".text.fontFamily(semiBold).size(15).make()),
            10.heightBox,
            Divider(
              color: borderColor,
            ),
          ],
        )
            .box
            .border(color: borderColor)
            .padding(
              EdgeInsets.all(16),
            )
            .margin(EdgeInsets.all(10))
            .rounded
            .make(),
      ),
    );
  }
}
