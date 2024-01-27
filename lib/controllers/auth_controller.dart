import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/residential_info_screen.dart';

class AuthController extends ChangeNotifier {
  late var userDetails;
  bool is_loading = false;

  set isLoading(bool value) {
    is_loading = value;
    notifyListeners();
  }

  navigateUser(context) async {
    await fetchUserDetails();
    if (userDetails['profile_status']['registration'] == false) {
      if (userDetails['registration_status']['personal'] == false) {
        Get.off(() => RegistrationScreen());
      } else if (userDetails['registration_status']['professional'] == false) {
        Get.off(() => ProfessionalInfoScreen());
      } else if (userDetails['registration_status']['family'] == false) {
        Get.off(() => FamilyInfoScreen());
      } else if (userDetails['registration_status']['residential'] == false) {
        Get.off(() => ResidentialInfoScreen());
      } else if (userDetails['registration_status']['contact'] == false) {
        Get.off(() => ContactInfoScreen());
      } else if (userDetails['registration_status']['expectations'] == false) {
        Get.off(() => ExpectionScreen());
      } else if (userDetails['registration_status']['upload_images'] == false) {
        Get.off(() => const UploadPhotosScreen());
      } else if (userDetails['registration_status']['upload_docs'] == false) {
        Get.off(() => UploadDocumentScreen());
      } else {
        Get.off(() => const VerificationPendingScreen());
      }
    } else if (userDetails['profile_status']['verification'] == false) {
      Get.off(() => const VerificationPendingScreen());
    } else {
      Get.off(() => Home());
    }

    // else if (userDetails['profile_status']['membership_active'] == false) {
    //   Get.off(() => const PaymentGatwayScreen());
    // }
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
    var count;
    await database.collection(registerCollection).count().get().then((value) {
      count = value.count;
    });

    int numberOfDocuments = count + 1;
    String year = DateTime.now().year.toString().substring(2);
    String registrationNumber = numberOfDocuments.toString();
    registrationNumber = registrationNumber.padLeft(5, "0");

    return "REG$year$registrationNumber";
  }

  storeAuthDetails({name, email}) async {
    await database.collection(registerCollection).doc(user!.uid).set(
      {
        "uid": user!.uid,
        "reg_id": await generateRegistrationId(),
        "username": name,
        "login_email": email,
        "profile_status": {
          "registration": false,
          "verification": false,
          "membership_active": false
        },
        "registration_status": {
          "personal": false,
          "professional": false,
          "family": false,
          "residential": false,
          "contact": false,
          "expectations": false,
          "upload_images": false,
          "upload_docs": false,
        }
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
      } else if (e.code == "invalid-credential") {
        showSnackbar(context, "Email address does not exist.");
      } else if (e.code == "invalid-email") {
        showSnackbar(context, "Invalid email address.");
      } else if (e.code == "channel-error") {
        showSnackbar(context, "Something went wrong check your credentials.");
      } else {
        showSnackbar(context, "Something went wrong .");
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
      print(e.code);
      if (e.code == "invalid-email") {
        showSnackbar(context, "Invalid Email id.");
      } else if (e.code == "email-already-in-use") {
        showSnackbar(context, "This email id already exists!");
      } else if (e.code == "weak-password") {
        showSnackbar(context, "weak password! Please enter a strong password");
      }
    }
    return user;
  }

  Future<void> userSignOut() async {
    await auth.signOut();
    user = null;
  }

  Future<void> forgetPassword(context, email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      showSnackbar(context,
          "We've just sent a password reset email to your registered email address. Please check your inbox and follow the instructions to reset your password. If you don't see the email, kindly check your spam folder. For any assistance, feel free to contact our support team.");
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, "Check your email.");
    }
  }
}
