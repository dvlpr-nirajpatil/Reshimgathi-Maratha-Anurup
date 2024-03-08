import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static Future<void> init() async {
    final messaging = FirebaseMessaging.instance;
    messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    final token = await messaging.getToken();
  }
}
