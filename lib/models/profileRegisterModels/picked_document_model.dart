import 'package:image_picker/image_picker.dart';
import 'package:reshimgathi/consts/shared_storage.dart';

class PickedDocuments {
  XFile? leavingCertificate;
  XFile? adharCard;

  PickedDocuments() {
    fetch();
  }

  Future<void> store() async {
    await shared_storage.write(key: 'adhar_card', value: adharCard!.path);
    await shared_storage.write(
        key: 'leaving_certificate', value: leavingCertificate!.path);
  }

  Future<void> fetch() async {
    // Retrieve the JSON string from shared preferences
    String? adharCard = await shared_storage.read(key: 'adhar_card');
    String? leavingCertificate =
        await shared_storage.read(key: 'leaving_certificate');

    if (adharCard != null &&
        adharCard.isNotEmpty &&
        leavingCertificate != null &&
        leavingCertificate.isNotEmpty) {
      this.adharCard = XFile(adharCard);
      this.leavingCertificate = XFile(leavingCertificate);
    }
  }
}
