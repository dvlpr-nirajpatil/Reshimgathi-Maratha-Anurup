import 'dart:math';

import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/strings.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/services/firestore_services.dart';
import 'package:reshimgathi/views/home/home.dart';
import 'package:reshimgathi/views/profile_registration_form/payment_getway_screen.dart';

class VerificationPendingScreen extends StatefulWidget {
  const VerificationPendingScreen({super.key});
  static String id = "VerificationScreen";

  @override
  State<VerificationPendingScreen> createState() =>
      _VerificationPendingScreenState();
}

class _VerificationPendingScreenState extends State<VerificationPendingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirestoreServices.getUser(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              var data = snapshot.data!.docs[0];
              if (data['profile_status']['verification'] == true) {
                Future.delayed(
                    const Duration(seconds: 1), () => Get.off(() => Home()));
              }
            }
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Image(
                      width: 200,
                      image: AssetImage(igUnderVerification),
                    ),
                  ),
                  60.heightBox,
                  "Profile Verification in Progress"
                      .text
                      .size(16)
                      .color(pinkColor)
                      .fontFamily(semiBold)
                      .make(),
                  5.heightBox,
                  verificationMsg.text.align(TextAlign.justify).make(),
                  5.heightBox,
                  "$marathiAppName, $orgName".text.color(pinkColor).make(),
                ],
              ),
            );
          }),
    );
  }
}
