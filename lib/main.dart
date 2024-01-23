import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/controllers/auth_controller.dart';
import 'package:reshimgathi/controllers/home_screen_controller.dart';
import 'package:reshimgathi/firebase_options.dart';
import 'package:reshimgathi/views/auth-screens/splash-screen/splash_screen.dart';

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
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => HomeScreenController()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textSelectionTheme:
              TextSelectionThemeData(cursorColor: lightPinkColor),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: pinkColor)),
            hintStyle: TextStyle(fontSize: 16, color: darkGrey),
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
                backgroundColor: pinkColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                minimumSize: const Size(double.infinity, 45)),
          ),
          fontFamily: regular,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
