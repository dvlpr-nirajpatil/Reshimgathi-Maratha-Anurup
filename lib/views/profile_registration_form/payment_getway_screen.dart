import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/services/firestore_services.dart';
import 'package:reshimgathi/views/home/home.dart';

class PaymentGatwayScreen extends StatelessWidget {
  const PaymentGatwayScreen({super.key});
  static String id = "PaymentGatewayScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Gateway'),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getUser(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              if (data['membership_active'] == true) {
                Future.delayed(
                  const Duration(seconds: 1),
                  () => Get.off(
                    () => Home(),
                  ),
                );
              }
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.credit_card,
                    size: 100,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your payment logic here
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Make Payment',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}