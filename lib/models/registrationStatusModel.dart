import 'package:secure_shared_preferences/secure_shared_pref.dart';

class RegistrationStatusModel {
  bool personal = false;
  bool professional = false;
  bool family = false;
  bool residential = false;
  bool contact = false;
  bool expectations = false;
  bool photos = false;
  bool documents = false;

  store(val) async {
    final pref = await SecureSharedPref.getInstance();
    switch (val) {
      case 1:
        personal = true;
        await pref.putBool('r_personal', true);
        break;
      case 2:
        professional = true;
        await pref.putBool('r_professional', true);
        break;
      case 3:
        family = true;
        await pref.putBool('r_family', true);
        break;
      case 4:
        residential = true;
        await pref.putBool('r_residential', true);
        break;
      case 5:
        contact = true;
        await pref.putBool('r_contact', true);
        break;
      case 6:
        expectations = true;
        await pref.putBool('r_expectations', true);
        break;
      case 7:
        photos = true;
        await pref.putBool('r_photos', true);
        break;
      case 8:
        documents = true;
        await pref.putBool('r_documents', true);
        break;
    }
  }

  checkProfileCompleted() {
    return personal! &&
        professional! &&
        family! &&
        residential! &&
        contact! &&
        expectations! &&
        photos! &&
        documents!;
  }
}
