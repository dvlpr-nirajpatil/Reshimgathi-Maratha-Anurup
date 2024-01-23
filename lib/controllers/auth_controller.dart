import 'dart:developer';

import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/firebase_consts.dart';
import 'package:reshimgathi/shared-widget/custom_snackbar.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/payment_getway_screen.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/profile_creation_form.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/verification_waiting_screen.dart';
import 'package:reshimgathi/views/home/home.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class AuthController extends ChangeNotifier {
  // ignore: prefer_typing_uninitialized_variables
  var userDetails;
  bool is_loading = false;

  navigateUser() async {
    await fetchUserDetails();

    if (userDetails['registration'] == false) {
      Get.offAll(
        () => const ProfileCreationScreen(),
      );
    } else if (userDetails['verification'] == false) {
      Get.offAll(
        () => const VerificationPendingScreen(),
      );
    } else if (userDetails['membership_active'] == false) {
      Get.offAll(
        () => const PaymentGatwayScreen(),
      );
    } else {
      Get.offAll(() => Home());
    }
  }

  void reset() {
    userDetails = null;
    is_loading = false;
    notifyListeners();
  }

  Future<void> fetchUserDetails() async {
    QuerySnapshot querySnapshot = await database
        .collection(registerCollection)
        .where('uid', isEqualTo: user!.uid)
        .get();

    userDetails = querySnapshot.docs[0].data() as Map<String, dynamic>;
  }

  Future<void> clearSharedPrerences() async {
    SecureSharedPref pref = await SecureSharedPref.getInstance();
    await pref.clearAll();
  }

  Future<void> mountUser() async {
    SecureSharedPref pref = await SecureSharedPref.getInstance();
    await pref.putBool('firstTime', false);
  }

  Future<bool?> isUserComesFirstTime() async {
    SecureSharedPref pref = await SecureSharedPref.getInstance();

    bool? firstTime = await pref.getBool('firstTime');

    if (firstTime == null) {
      await pref.putBool('firstTime', true);
      return true;
    } else {
      return false;
    }
  }

  Future<String> generateRegistrationId() async {
    QuerySnapshot querySnapshot =
        await database.collection(registerCollection).get();

    int numberOfDocuments = querySnapshot.size + 1;
    String year = DateTime.now().year.toString().substring(2);
    String registrationNumber = numberOfDocuments.toString();
    registrationNumber = registrationNumber.padLeft(5, "0");

    return "REG$year$registrationNumber";
  }

  storeAuthDetails({name, email}) async {
    await database.collection(registerCollection).add(
      {
        "uid": user!.uid,
        "reg_id": await generateRegistrationId(),
        "name": name,
        "email": email,
        "registration": false,
        "verification": false,
        "membership_active": false
      },
    );
  }

  Future<UserCredential?> userSignIn(context,
      {String? email, String? password}) async {
    UserCredential? user;
    try {
      user = await auth.signInWithEmailAndPassword(
          email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      if (e.code == "INVALID_LOGIN_CREDENTIALS") {
        showSnackbar(context,
            "Incorrect login credentials. Please check and try again.");
      }
    }
    return user;
  }

  Future<UserCredential?> userSignUp(context,
      {String? email, String? password}) async {
    UserCredential? user;

    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
    } on FirebaseAuthException catch (e) {
      print("error code :" + e.code);

      if (e.code == "email-already-in-use") {
        showSnackbar(context, "The email you entered is already registered.");
      }
    }
    return user;
  }

  Future<void> userSignOut() async {
    await auth.signOut();
  }
}
