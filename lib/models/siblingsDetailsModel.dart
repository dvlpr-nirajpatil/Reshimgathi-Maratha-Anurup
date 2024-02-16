import 'package:reshimgathi/consts/consts.dart';

class SibblingsDetails {
  TextEditingController name = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController maritalStatus = TextEditingController();

  SibblingsDetails({name, occupation, mari}) {
    this.name.text = name ?? "";
    this.occupation.text = occupation ?? "";
    maritalStatus.text = mari ?? "";
  }
}
