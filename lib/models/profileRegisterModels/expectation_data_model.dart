import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/shared_storage.dart';

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
    heightInFeet.text = await shared_storage.read(key: "xHeightInFeet") ?? "";
    heightInInches.text = await shared_storage.read(key: "xHeightInInch") ?? "";
    maxAgeDifference.text =
        await shared_storage.read(key: "xMaxAgeDifference") ?? "";
    education.text = await shared_storage.read(key: "xEducation") ?? "";
    occupation.text = await shared_storage.read(key: "xOccupation") ?? "";
    location.text = await shared_storage.read(key: "xLocation") ?? "";
    maritalStatus = await shared_storage.read(key: "xMaritialStatus");
    mangalAccepted = await shared_storage.read(key: "xMangalAccepted");
    handicap = await shared_storage.read(key: "xHandicaped");
  }

  store() async {
    await shared_storage.write(key: "xHeightInFeet", value: heightInFeet.text);
    await shared_storage.write(
        key: "xHeightInInch", value: heightInInches.text);
    await shared_storage.write(
        key: "xMaxAgeDifference", value: maxAgeDifference.text);
    await shared_storage.write(key: "xEducation", value: education.text);
    await shared_storage.write(key: "xOccupation", value: occupation.text);
    await shared_storage.write(key: "xLocation", value: location.text);
    await shared_storage.write(
        key: "xMaritialStatus", value: maritalStatus ?? "");
    await shared_storage.write(
        key: "xMangalAccepted", value: mangalAccepted ?? "");
    await shared_storage.write(key: "xHandicaped", value: handicap ?? "");
  }
}
