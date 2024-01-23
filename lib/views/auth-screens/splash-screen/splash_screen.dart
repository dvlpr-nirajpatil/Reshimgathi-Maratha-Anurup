import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/firebase_consts.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/controllers/auth_controller.dart';
import 'package:reshimgathi/views/auth-screens/landing-screen/landing_screen.dart';
import 'package:reshimgathi/views/auth-screens/signin-screen/signin_screen.dart';
import 'package:reshimgathi/views/auth-screens/splash-screen/components/poster_widget.dart';
import 'package:reshimgathi/views/home-screen/home_screen.dart';
import 'package:reshimgathi/views/home/home.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // ignore: non_constant_identifier_names
  ChangeScreen(context) {
    var controller = Provider.of<AuthController>(context, listen: false);

    Future.delayed(
      const Duration(milliseconds: 2000),
      () async {
        bool? isUserComesFirstTime = await controller.isUserComesFirstTime();
        if (isUserComesFirstTime == true) {
          Get.off(() => const LandingScreen(), transition: Transition.fadeIn);
        } else {
          auth.userChanges().listen((user) {
            if (user != null) {
              controller.navigateUser();
            } else {
              Get.off(() => SignInScreen());
            }
          });

          Get.off(() => SignInScreen(), transition: Transition.fadeIn);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ChangeScreen(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100),
        width: context.width,
        height: context.height,
        decoration: BoxDecoration(
          gradient: SplashScreenLinearGradient,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                posterWidget(img: igJijau, title: "|| जय जिजाऊ ||"),
                30.widthBox,
                posterWidget(img: igShivaji, title: "|| जय शिवराय ||"),
              ],
            ),
            40.heightBox,
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    igWedding,
                    width: context.width * 0.8,
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 20,
                  child: Image.asset(igAppLogo, width: context.width * 0.8),
                ),
                Positioned(
                    bottom: -80,
                    right: 50,
                    child: "मराठा अनुरुप"
                        .text
                        .fontFamily(marathiBold)
                        .size(12)
                        .white
                        .make())
              ],
            ),
            100.heightBox,
            "वधु-वर सुची "
                .text
                .align(TextAlign.center)
                .size(32)
                .fontFamily(marathiBold)
                .white
                .make(),
            110.heightBox,
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  color: RedBannerColor,
                  width: context.width,
                  height: context.height * 0.14,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "मराठा सेवा संघ, धुळे संचलित"
                          .text
                          .white
                          .size(16)
                          .fontFamily(marathiBold)
                          .make(),
                      "वधु-वर सूचक व सामुदायिक विवाह कक्ष,"
                          .text
                          .white
                          .size(16)
                          .fontFamily(marathiBold)
                          .make(),
                      "धुळे जिल्हा"
                          .text
                          .white
                          .size(16)
                          .fontFamily(marathiBold)
                          .make()
                    ],
                  ),
                ),
                Positioned(
                  bottom: 105,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: yellowBannerColor, boxShadow: shadowSmall),
                    child: Image.asset(
                      igLogo,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
