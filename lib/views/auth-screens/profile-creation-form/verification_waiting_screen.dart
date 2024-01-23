import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/firebase_consts.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/services/firestore_services.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/payment_getway_screen.dart';

class VerificationPendingScreen extends StatelessWidget {
  const VerificationPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirestoreServices.getUser(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              if (data['verification'] == true) {
                Get.to(() => PaymentGatwayScreen());
              }
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.pending_actions_outlined,
                    size: 100,
                    color: pinkColor,
                  ),
                  10.heightBox,
                  "Verification Pending"
                      .text
                      .size(18)
                      .color(pinkColor)
                      .fontFamily(semiBold)
                      .make()
                ],
              ),
            );
          }),
    );
  }
}
