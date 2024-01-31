import 'package:reshimgathi/consts/consts.dart';

class FamilyDataModel {
  TextEditingController fatherName = TextEditingController();
  TextEditingController fatherOccupation = TextEditingController();
  TextEditingController motherName = TextEditingController();
  TextEditingController motherOccupation = TextEditingController();
  TextEditingController numberOfBrothers = TextEditingController();
  TextEditingController numberOfSisters = TextEditingController();
  TextEditingController numberOfMama = TextEditingController();

  List<SibblingsDetails> sistersInfo = [];
  List<SibblingsDetails> brothersInfo = [];
  List<MamaDetails> mamasInfo = [];
  TextEditingController mamaNativePlace = TextEditingController();

  // Fethced To be in controllers
  int noOfBrother = 0;
  int noOfSister = 0;
  int noOfMama = 0;

  FamilyDataModel() {
    fetch();
  }

  fetch() async {
    var pref = await SecureSharedPref.getInstance();
    fatherName.text = await pref.getString('fatherName') ?? "";
    fatherOccupation.text = await pref.getString('fatherOccupation') ?? "";
    motherName.text = await pref.getString('motherName') ?? "";
    motherOccupation.text = await pref.getString('motherOccupation') ?? "";
    int noOfBrother = await pref.getInt('noOfBrother') ?? 0;
    numberOfBrothers.text = noOfBrother.toString();
    int noOfSister = await pref.getInt('noOfSister') ?? 0;
    numberOfSisters.text = noOfSister.toString();
    int noOfMama = await pref.getInt('noOfMama') ?? 0;
    numberOfMama.text = noOfMama.toString();
  }

  store() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("fatherName", fatherName.text);
    pref.putString("fatherOccupation", fatherOccupation.text);
    pref.putString("motherName", motherName.text);
    pref.putString("motherOccupation", motherOccupation.text);
    pref.putInt("noOfBrother", noOfBrother);
    pref.putInt("noOfSister", noOfSister);
    pref.putInt("noOfMama", noOfMama);
    pref.putString('mamaNativePlace', mamaNativePlace.text);

    //TODO -  store brother sister & mamma Remaining
  }

  List<Map<String, String>> getMamasDetails() {
    List<Map<String, String>> mama = [];

    for (MamaDetails i in mamasInfo) {
      mama.add({
        "name": i.name!,
        "contact_no": i.contactNo!,
        "occupation": i.occupation!
      });
    }

    return mama;
  }

  List<Map<String, String>> getBrothersDetails() {
    List<Map<String, String>> brothers = [];

    for (var i in brothersInfo) {
      brothers.add({
        "name": i.name!,
        "occupation": i.occupation!,
        "marital_status": i.maritalStatus!
      });
    }

    return brothers;
  }

  List<Map<String, String>> getSistersDetails() {
    List<Map<String, String>> sisters = [];

    for (var i in sistersInfo) {
      sisters.add({
        "name": i.name!,
        "occupation": i.occupation!,
        "marital_status": i.maritalStatus!
      });
    }

    return sisters;
  }
}
