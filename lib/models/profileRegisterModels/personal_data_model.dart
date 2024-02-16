import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/shared_storage.dart';

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
    await shared_storage.write(key: "firstName", value: firstName.text);
    await shared_storage.write(key: "lastName", value: lastName.text);
    await shared_storage.write(key: "birthDate", value: birthDate.text);
    await shared_storage.write(key: "birthTime", value: birthTime.text);
    await shared_storage.write(key: "birthPlace", value: birthPlace.text);
    await shared_storage.write(key: "birthName", value: birthName.text);
    await shared_storage.write(key: "feet", value: heightInFeet.text);
    await shared_storage.write(key: "inch", value: heightInInches.text);
    await shared_storage.write(
        key: "physicalDisabilityDSC", value: physicalDisability.text);
    await shared_storage.write(key: "gender", value: gender ?? "");
    await shared_storage.write(key: "bloodGroup", value: bloodGroup ?? "");
    await shared_storage.write(key: "ras", value: ras ?? "");
    await shared_storage.write(key: "caste", value: caste ?? "");
    await shared_storage.write(
        key: "maritalStatus", value: maritalStatus ?? "");
    await shared_storage.write(
        key: "physicalDisability", value: isPhysicallyDissabled ?? "");
  }

  fetch() async {
    firstName.text = await shared_storage.read(key: "firstName") ?? "";
    lastName.text = await shared_storage.read(key: "lastName") ?? "";
    birthDate.text = await shared_storage.read(key: "birthDate") ?? "";
    birthTime.text = await shared_storage.read(key: "birthTime") ?? "";
    birthPlace.text = await shared_storage.read(key: "birthPlace") ?? "";
    birthName.text = await shared_storage.read(key: "birthName") ?? "";
    heightInFeet.text = await shared_storage.read(key: "feet") ?? "";
    heightInInches.text = await shared_storage.read(key: "inch") ?? "";
    physicalDisability.text =
        await shared_storage.read(key: "physicalDisabilityDSC") ?? "";
    gender = await shared_storage.read(key: "gender");
    caste = await shared_storage.read(key: "caste");
    ras = await shared_storage.read(key: "ras");
    bloodGroup = await shared_storage.read(key: "bloodGroup");
    maritalStatus = await shared_storage.read(key: "maritalStatus");
    isPhysicallyDissabled =
        await shared_storage.read(key: "physicalDisability");
  }
}
