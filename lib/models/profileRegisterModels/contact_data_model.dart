import 'package:reshimgathi/consts/consts.dart';

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
    var pref = await SecureSharedPref.getInstance();
    fatherContactNo.text = await pref.getString("fatherContact") ?? "";
    motherContactNo.text = await pref.getString("mothercontact") ?? "";
    whatsappNumber.text = await pref.getString("whatsapp") ?? "";
    emailAddress.text = await pref.getString("emailAddress") ?? "";
  }

  store() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("fatherContact", fatherContactNo.text);
    pref.putString("mothercontact", motherContactNo.text);
    pref.putString("whatsapp", whatsappNumber.text);
    pref.putString("emailAddress", emailAddress.text);
  }
}
