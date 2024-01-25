import 'package:reshimgathi/consts/consts.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static String id = "LandingScreen";
  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(igLanding),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Vx.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              width: context.screenWidth,
              height: 302,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "शोधा आपला जीवनसाथी".text.size(30).semiBold.make(),
                  30.heightBox,
                  "Find your perfect match on \nReshimgathi"
                      .text
                      .size(16)
                      .gray400
                      .align(TextAlign.center)
                      .make(),
                  20.heightBox,
                  customAuthScreenButton(context, title: "Create an Account",
                      ontap: () {
                    authController.mountUser();
                    Get.off(() => SignInScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: Duration(milliseconds: 300));
                  })
                ],
              ),
            ),
          ),
        ],
      ).box.make(),
    );
  }
}
