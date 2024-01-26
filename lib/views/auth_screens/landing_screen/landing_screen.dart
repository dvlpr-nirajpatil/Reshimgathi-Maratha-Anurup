import 'package:reshimgathi/consts/consts.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static String id = "LandingScreen";
  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(igLanding),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: context.height * 0.38,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.06,
                  ),
                  "शोधा आपला जीवनसाथी"
                      .text
                      .align(TextAlign.center)
                      .fontFamily(semiBold)
                      .size(28)
                      .make(),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                  "Find your perfect match on\n Reshimgathi!"
                      .text
                      .color(lightTextColor)
                      .size(16)
                      .align(TextAlign.center)
                      .make(),
                  const Spacer(),
                  FilledButton(
                    onPressed: () {
                      Get.off(() => SignInScreen());
                    },
                    child: "Create an account".text.fontFamily(semiBold).make(),
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
