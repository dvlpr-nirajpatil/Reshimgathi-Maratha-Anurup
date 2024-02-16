import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/payment_gateway.dart';
import 'package:reshimgathi/controllers/profile_screen_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Reshimgathi());
}

class Reshimgathi extends StatelessWidget {
  const Reshimgathi({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PaymentGatewayController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => HomeScreenController()),
        ChangeNotifierProvider(create: (_) => ProfileScreenController()),
        ChangeNotifierProvider(create: (_) => ProfileRegistrationController()),
      ],
      child: GetMaterialApp(
        home: const SplashScreen(),
        // home: PaymentGatewayScreen(),
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
      ),
    );
  }
}
