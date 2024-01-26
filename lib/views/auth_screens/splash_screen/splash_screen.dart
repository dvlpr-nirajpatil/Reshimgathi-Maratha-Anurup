import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth_screens/splash_screen/components/splash_screen_poster.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  // ignore: non_constant_identifier_names
  ChangeScreen(context) {
    var controller = Provider.of<AuthController>(context, listen: false);

    Future.delayed(
      const Duration(milliseconds: 2000),
      () async {
        // check if user comes first time on our application
        bool? isUserComesFirstTime = await controller.isUserComesFirstTime();
        // if yes then navigate user to landing screen
        if (isUserComesFirstTime == true) {
          Get.off(() => const LandingScreen());
        } // else to screens according to his profile status
        else {
          auth.userChanges().listen(
            (user) {
              if (user != null) {
                controller.navigateUser(context);
              } else {
                Get.off(() => SignInScreen());
              }
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ChangeScreen(context);
    return Scaffold(
      body: splashScreenPoster(context),
    );
  }
}
