import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/verification_waiting_screen.dart';

Container registrationSuccessScreen(context) {
  Future.delayed(Duration(seconds: 2), () {
    Get.off(() => VerificationPendingScreen());
  });

  return Container(
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,

      children: [
        30.heightBox,
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: faintPinkColor),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            Container(
              height: 240,
              width: 240,
              decoration: BoxDecoration(
                border: Border.all(color: lightPinkColor),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
            CircleAvatar(
              backgroundColor: pinkColor,
              radius: 70,
              child: Icon(
                Icons.done,
                size: 60,
                color: Vx.white,
              ),
            )
          ],
        ),
        20.heightBox,
        "Registration Successfully!".text.size(24).semiBold.make(),
        10.heightBox,
        "Your document are sent to verification after \n verification you got a update."
            .text
            .align(TextAlign.center)
            .size(16)
            .make()
      ],
    ),
  );
}
