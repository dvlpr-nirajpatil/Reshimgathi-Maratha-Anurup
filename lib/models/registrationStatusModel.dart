import 'package:reshimgathi/consts/shared_storage.dart';

class RegistrationStatusModel {
  String personal = "NO";
  String professional = "NO";
  String family = "NO";
  String residential = "NO";
  String contact = "NO";
  String expectations = "NO";
  String photos = "NO";
  String documents = "NO";

  store(val) async {
    switch (val) {
      case 1:
        personal = "YES";
        await shared_storage.write(key: 'r_personal', value: "YES");
        break;
      case 2:
        professional = "YES";
        await shared_storage.write(key: 'r_professional', value: "YES");
        break;
      case 3:
        family = "YES";
        await shared_storage.write(key: 'r_family', value: "YES");
        break;
      case 4:
        residential = "YES";
        await shared_storage.write(key: 'r_residential', value: "YES");
        break;
      case 5:
        contact = "YES";
        await shared_storage.write(key: 'r_contact', value: "YES");
        break;
      case 6:
        expectations = "YES";
        await shared_storage.write(key: 'r_expectations', value: "YES");
        break;
      case 7:
        photos = "YES";
        await shared_storage.write(key: 'r_photos', value: "YES");
        break;
      case 8:
        documents = "YES";
        await shared_storage.write(key: 'r_documents', value: "YES");
        break;
    }
  }

  checkProfileCompleted() {
    return personal == "YES" &&
        professional == "YES" &&
        family == "YES" &&
        residential == "YES" &&
        contact == "YES" &&
        expectations == "YES" &&
        photos == "YES" &&
        documents == "YES";
  }
}
