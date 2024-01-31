import 'package:image_picker/image_picker.dart';
import 'package:secure_shared_preferences/secure_shared_pref.dart';

class PickedDocuments {
  XFile? leavingCertificate;
  XFile? adharCard;

  PickedDocuments() {
    fetch();
  }

  Future<void> store() async {
    final prefs = await SecureSharedPref.getInstance();

    // Convert the list to a JSON-encoded string

    // Store the JSON string in shared preferences
    prefs.putString('adhar_card', adharCard!.path);
    prefs.putString('leaving_certificate', leavingCertificate!.path);
  }

  Future<void> fetch() async {
    final prefs = await SecureSharedPref.getInstance();

    // Retrieve the JSON string from shared preferences
    String? adharCard = await prefs.getString('adhar_card');
    String? leavingCertificate = await prefs.getString('leaving_certificate');

    if (adharCard != null &&
        adharCard.isNotEmpty &&
        leavingCertificate != null &&
        leavingCertificate.isNotEmpty) {
      this.adharCard = XFile(adharCard);
      this.leavingCertificate = XFile(leavingCertificate);
    }
  }
}
