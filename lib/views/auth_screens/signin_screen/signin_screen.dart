import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/push_notification.dart';
import 'package:reshimgathi/views/auth_screens/forget_password/forget_password.dart';
import 'package:reshimgathi/views/auth_screens/signup_screen/signup_screen.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  static String id = "SignInScreen";

  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // ignore: unused_field
  late FirebaseMessaging _messaging;

  // ignore: unused_field
  int _totalnotification = 0;

  late PushNotification _notificationInfo;

  void registerNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Message title: ${message.notification?.title}');

        // parse the message received
        // ignore: unused_local_variable
        PushNotification notification = PushNotification(
          title: message.notification?.title ?? " ",
          body: message.notification?.body ?? " ",
          dataTitle: message.data['title'] ?? " ",
          dataBody: message.data['body'] ?? " ",
        );

        setState(() {
          _notificationInfo = notification;
          _totalnotification++;
        });

        // ignore: unnecessary_null_comparison
        if (_notificationInfo != null) {
          // for display notification in overlay
          showSimpleNotification(
            Text(_notificationInfo.title.toString()),
            subtitle: Text(_notificationInfo.body ?? " "),
            background: Colors.cyan.shade700,
            duration: Duration(seconds: 2),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      //Parse the message received
      if (initialMessage != null) {
//Parse the message received
        PushNotification notification = PushNotification(
          title: initialMessage.notification?.title ?? '',
          body: initialMessage.notification?.body ?? "",
          dataTitle: initialMessage.data['title'] ?? "",
          dataBody: initialMessage.data['body'] ?? "",
        );

        setState(() {
          _notificationInfo = notification;
          _totalnotification++;
        });
      }
    }
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    //----------------
    user = FirebaseAuth.instance.currentUser;
    _firebaseMessaging.getToken().then((token) {
      print("Firebase Token : $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //Handle incoming messages
      print("Received Message: ${message.notification?.body}");
    });
    //-------------
    _totalnotification = 0;
    registerNotification();
    checkForInitialMessage();

//For handling notification when app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title ?? "",
        body: message.notification?.body ?? "",
        dataTitle: message.data['title'] ?? "",
        dataBody: message.data['body'] ?? "",
      );

      setState(() {
        _notificationInfo = notification;
        _totalnotification++;
      });
    });

    _emailField.text = "dev.nirajpatil@gmail.com";
    _passField.text = "12345678";
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailField = TextEditingController();

  TextEditingController _passField = TextEditingController();

  // Email validation regex pattern
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: screenPadding.copyWith(top: 200),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Hello Again!".text.size(24).semiBold.make(),
              25.heightBox,
              customTextFormField(
                required: true,
                label: "Email",
                controller: _emailField,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }

                  return null;
                },
              ),
              customTextFormField(
                required: true,
                ispass: true,
                label: "password",
                controller: _passField,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  // You can add more complex password validation logic here if needed
                  return null;
                },
              ),
              20.heightBox,
              10.heightBox,
              10.heightBox,
              Align(
                alignment: Alignment.bottomRight,
                child: "Forget Password?"
                    .text
                    .color(pinkColor)
                    .size(14)
                    .make()
                    .onTap(() {
                  Get.to(() => ForgetPassword());
                }),
              ),
              15.heightBox,
              Consumer<AuthController>(builder: (context, controller, xxx) {
                return FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        controller.isLoading = true;
                        // Form is valid, perform sign-in logic here
                        String email = _emailField.text.trimRight();
                        String password = _passField.text.trimRight();

                        authController
                            .userSignIn(context,
                                email: email, password: password)
                            .then(
                          (value) async {
                            if (value != null) {
                              await authController.navigateUser(context);
                            }
                          },
                        );
                      }
                      Future.delayed(const Duration(seconds: 1), () {
                        controller.isLoading = false;
                      });
                    },
                    child: controller.isloading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : "Sign In".text.fontFamily(semiBold).size(16).make());
              }),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Dont have an account ?  ".text.make(),
                  "Sign Up!"
                      .text
                      .color(pinkColor)
                      .fontFamily(semiBold)
                      .make()
                      .onTap(() {
                    GoRouter.of(context).pushNamed(SignupScreen.id);
                  })
                ],
              ),
              60.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
