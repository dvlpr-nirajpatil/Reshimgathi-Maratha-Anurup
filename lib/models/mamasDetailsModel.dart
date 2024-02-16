import 'package:reshimgathi/consts/consts.dart';

class MamaDetails {
  MamaDetails({name, contact, occupation}) {
    this.name.text = name ?? "";
    contactNo.text = contact ?? "";
    this.occupation.text = occupation ?? "";
  }
  TextEditingController name = TextEditingController();
  TextEditingController contactNo = TextEditingController();
  TextEditingController occupation = TextEditingController();
}
