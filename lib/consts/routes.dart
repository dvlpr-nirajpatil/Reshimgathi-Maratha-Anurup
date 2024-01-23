import 'package:go_router/go_router.dart';
import 'package:reshimgathi/views/auth-screens/landing-screen/landing_screen.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/payment_getway_screen.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/profile_creation_form.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/verification_waiting_screen.dart';
import 'package:reshimgathi/views/auth-screens/signin-screen/signin_screen.dart';
import 'package:reshimgathi/views/auth-screens/signup-screen/signup_screen.dart';
import 'package:reshimgathi/views/auth-screens/splash-screen/splash_screen.dart';
import 'package:reshimgathi/views/home/home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: SignInScreen.id,
      path: '/SignIn',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      name: LandingScreen.id,
      path: '/Landing',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      name: ProfileCreationScreen.id,
      path: '/Registration',
      builder: (context, state) => const ProfileCreationScreen(),
    ),
    GoRoute(
      name: VerificationPendingScreen.id,
      path: '/VerificationPending',
      builder: (context, state) => const VerificationPendingScreen(),
    ),
    GoRoute(
      name: PaymentGatwayScreen.id,
      path: '/PaymentGateway',
      builder: (context, state) => const PaymentGatwayScreen(),
    ),
    GoRoute(
      name: Home.id,
      path: '/Home',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      name: SignupScreen.id,
      path: '/SignUpScreen',
      builder: (context, state) => SignupScreen(),
    )
  ],
);
