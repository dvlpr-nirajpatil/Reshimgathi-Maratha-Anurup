import 'package:reshimgathi/consts/consts.dart';

class PersonalDataModel {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController birthTime = TextEditingController();
  TextEditingController birthPlace = TextEditingController();
  TextEditingController birthName = TextEditingController();
  TextEditingController heightInFeet = TextEditingController();
  TextEditingController heightInInches = TextEditingController();
  TextEditingController physicalDisability = TextEditingController();
  String? gender;
  String? ras;
  String? bloodGroup;
  String? maritalStatus;
  String? isPhysicallyDissabled;
  String? caste;

  PersonalDataModel() {
    fetch();
  }

  store() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("firstName", firstName.text);
    pref.putString("lastName", lastName.text);
    pref.putString("birthDate", birthDate.text);
    pref.putString("birthTime", birthTime.text);
    pref.putString("birthPlace", birthPlace.text);
    pref.putString("birthName", birthName.text);
    pref.putString("feet", heightInFeet.text);
    pref.putString("inch", heightInInches.text);
    pref.putString("physicalDisabilityDSC", physicalDisability.text);
    pref.putString("gender", gender ?? "");
    pref.putString("bloodGroup", bloodGroup ?? "");
    pref.putString("ras", ras ?? "");
    pref.putString("caste", caste ?? "");
    pref.putString("maritalStatus", maritalStatus ?? "");
    pref.putString("physicalDisability", isPhysicallyDissabled ?? "");
  }

  fetch() async {
    var pref = await SecureSharedPref.getInstance();
    firstName.text = await pref.getString("firstName") ?? "";
    lastName.text = await pref.getString("lastName") ?? "";
    birthDate.text = await pref.getString("birthDate") ?? "";
    birthTime.text = await pref.getString("birthTime") ?? "";
    birthPlace.text = await pref.getString("birthPlace") ?? "";
    birthName.text = await pref.getString("birthName") ?? "";
    heightInFeet.text = await pref.getString("feet") ?? "";
    heightInInches.text = await pref.getString("inch") ?? "";
    physicalDisability.text =
        await pref.getString("physicalDisabilityDSC") ?? "";
    gender = await pref.getString("gender");
    caste = await pref.getString("caste");
    ras = await pref.getString("ras");
    bloodGroup = await pref.getString("bloodGroup");
    maritalStatus = await pref.getString("maritalStatus");
    isPhysicallyDissabled = await pref.getString("physicalDisability");
  }
}
