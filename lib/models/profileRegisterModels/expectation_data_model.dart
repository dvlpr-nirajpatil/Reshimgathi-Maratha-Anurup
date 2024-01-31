import 'package:reshimgathi/consts/consts.dart';

class ExpectationDataModel {
  TextEditingController heightInFeet = TextEditingController();
  TextEditingController heightInInches = TextEditingController();
  TextEditingController maxAgeDifference = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController location = TextEditingController();
  String? maritalStatus;
  String? mangalAccepted;
  String? handicap;

  ExpectationDataModel() {
    fetch();
  }

  fetch() async {
    var pref = await SecureSharedPref.getInstance();
    heightInFeet.text = await pref.getString("xHeightInFeet") ?? "";
    heightInInches.text = await pref.getString("xHeightInInch") ?? "";
    maxAgeDifference.text = await pref.getString("xMaxAgeDifference") ?? "";
    education.text = await pref.getString("xEducation") ?? "";
    occupation.text = await pref.getString("xOccupation") ?? "";
    location.text = await pref.getString("xLocation") ?? "";
    maritalStatus = await pref.getString("xMaritialStatus");
    mangalAccepted = await pref.getString("xMangalAccepted");
    handicap = await pref.getString("xHandicaped");
  }

  store() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("xHeightInFeet", heightInFeet.text);
    pref.putString("xHeightInInch", heightInInches.text);
    pref.putString("xMaxAgeDifference", maxAgeDifference.text);
    pref.putString("xEducation", education.text);
    pref.putString("xOccupation", occupation.text);
    pref.putString("xLocation", location.text);
    pref.putString("xMaritialStatus", maritalStatus ?? "");
    pref.putString("xMangalAccepted", mangalAccepted ?? "");
    pref.putString("xHandicaped", handicap ?? "");
  }
}
