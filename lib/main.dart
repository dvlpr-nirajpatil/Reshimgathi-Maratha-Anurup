import 'package:overlay_support/overlay_support.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/payment_gateway.dart';
import 'package:reshimgathi/controllers/profile_screen_controller.dart';
import 'package:reshimgathi/controllers/request_info_controller.dart';
import 'package:reshimgathi/controllers/saved_profile_controller.dart';
import 'package:reshimgathi/controllers/search_controller.dart';
import 'package:reshimgathi/models/push_notification.dart';
import 'package:reshimgathi/utility/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");

// ignore: unused_local_variable
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();

  if (initialMessage != null) {
    // ignore: unused_local_variable
    PushNotification notification = PushNotification(
      title: initialMessage.notification?.title ?? " ",
      body: initialMessage.notification?.body ?? " ",
      dataTitle: initialMessage.data['title'] ?? " ",
      dataBody: initialMessage.data['body'] ?? " ",
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // subscribe to topic on each app start-up
  await FirebaseMessaging.instance.subscribeToTopic('weather');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print(
          'Message also contained a notification: ${message.notification?.body}');
      print(
          'Message also contained a notification: ${message.notification?.title}');
    }
  });

  //ForHandling the notifications in Terminated State
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
        ChangeNotifierProvider(create: (_) => SavedProfilesController()),
        ChangeNotifierProvider(create: (_) => RequestInfoController()),
        ChangeNotifierProvider(create: (_) => SearchProfilesController())
      ],
      child: OverlaySupport(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: appThemeData,
          routerConfig: AppRoutes.router,
        ),
      ),
    );
  }
}
