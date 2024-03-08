import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth_screens/splash_screen/components/splash_screen_poster.dart';

// ignore: must_be_immutable
class SplashScreen extends StatelessWidget {
  static String id = "SplashScreen";

// ignore: unused_field
  ChangeScreen(context) {
    var controller = Provider.of<AuthController>(context, listen: false);

    Future.delayed(
      const Duration(milliseconds: 2000),
      () async {
        // check if user comes first time on our application
        bool? isUserComesFirstTime = await controller.isUserComesFirstTime();
        // if yes then navigate user to landing screen
        if (isUserComesFirstTime == true) {
          GoRouter.of(context).pushReplacementNamed(LandingScreen.id);
        } // else to screens according to his profile status
        else {
          auth.userChanges().listen(
            (user) {
              if (user != null) {
                controller.navigateUser(context);
              } else {
                GoRouter.of(context).pushReplacementNamed(SignInScreen.id);
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
