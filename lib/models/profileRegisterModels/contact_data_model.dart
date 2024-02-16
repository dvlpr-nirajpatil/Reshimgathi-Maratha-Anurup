import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/shared_storage.dart';

class ContactDataModel {
  // Contact information Screen variable
  TextEditingController fatherContactNo = TextEditingController();
  TextEditingController motherContactNo = TextEditingController();
  TextEditingController whatsappNumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();

  ContactDataModel() {
    fetch();
  }

  fetch() async {
    fatherContactNo.text =
        await shared_storage.read(key: "fatherContact") ?? "";
    motherContactNo.text =
        await shared_storage.read(key: "mothercontact") ?? "";
    whatsappNumber.text = await shared_storage.read(key: "whatsapp") ?? "";
    emailAddress.text = await shared_storage.read(key: "emailAddress") ?? "";
  }

  store() async {
    await shared_storage.write(
        key: "fatherContact", value: fatherContactNo.text);
    await shared_storage.write(
        key: "mothercontact", value: motherContactNo.text);
    await shared_storage.write(key: "whatsapp", value: whatsappNumber.text);
    await shared_storage.write(key: "emailAddress", value: emailAddress.text);
  }
}
