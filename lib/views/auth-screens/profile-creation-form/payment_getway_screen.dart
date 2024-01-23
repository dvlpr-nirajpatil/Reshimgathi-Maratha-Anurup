import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/services/firestore_services.dart';
import 'package:reshimgathi/views/home-screen/home_screen.dart';

class PaymentGatwayScreen extends StatelessWidget {
  const PaymentGatwayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Gateway'),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getUser(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              if (data['membership_active'] == true) {
                Get.to(() => HomeScreen());
              }
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.credit_card,
                    size: 100,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add your payment logic here
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
