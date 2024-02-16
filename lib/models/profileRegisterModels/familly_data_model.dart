import 'dart:convert';

import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/shared_storage.dart';

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
    fatherName.text = await shared_storage.read(key: 'fatherName') ?? "";
    fatherOccupation.text =
        await shared_storage.read(key: 'fatherOccupation') ?? "";
    motherName.text = await shared_storage.read(key: 'motherName') ?? "";
    motherOccupation.text =
        await shared_storage.read(key: 'motherOccupation') ?? "";

    String mamainf = await shared_storage.read(key: 'mamas_info') ?? "";
    mamaNativePlace.text =
        await shared_storage.read(key: 'mamaNativePlace') ?? "";
    if (mamainf != "") {
      List<dynamic> mamaDetails = jsonDecode(mamainf);
      mamasInfo = mamaDetails
          .map((e) => MamaDetails(
              name: e['name'],
              contact: e['contact'],
              occupation: e['occupation']))
          .toList();
    }

    noOfMama = mamasInfo.length;
    numberOfMama.text = mamasInfo.length.toString();

    String brotherInf = await shared_storage.read(key: 'brothers_info') ?? "";

    if (brotherInf != "") {
      List<dynamic> brotherDetails = jsonDecode(brotherInf);
      brothersInfo = brotherDetails
          .map((e) => SibblingsDetails(
              name: e['name'],
              occupation: e['occupation'],
              mari: e['marital_status']))
          .toList();
    }

    noOfBrother = brothersInfo.length;
    numberOfBrothers.text = brothersInfo.length.toString();

    String sistersInf = await shared_storage.read(key: 'sisters_info') ?? "";

    if (sistersInf != "") {
      List<dynamic> sistersDetails = jsonDecode(sistersInf);
      sistersInfo = sistersDetails
          .map((e) => SibblingsDetails(
              name: e['name'],
              occupation: e['occupation'],
              mari: e['marital_status']))
          .toList();
    }

    noOfSister = sistersInfo.length;
    numberOfSisters.text = sistersInfo.length.toString();
  }

  store() async {
    await shared_storage.write(key: "fatherName", value: fatherName.text);
    await shared_storage.write(
        key: "fatherOccupation", value: fatherOccupation.text);
    await shared_storage.write(key: "motherName", value: motherName.text);
    await shared_storage.write(
        key: "motherOccupation", value: motherOccupation.text);
    await shared_storage.write(
        key: "noOfBrother", value: noOfBrother.toString());
    await shared_storage.write(key: "noOfSister", value: noOfSister.toString());
    await shared_storage.write(key: "noOfMama", value: noOfMama.toString());
    await shared_storage.write(
        key: 'mamaNativePlace', value: mamaNativePlace.text);

    //TODO -  store brother sister & mamma Remaining

    // Convert the list to a JSON-encoded string
    String mamasInf = jsonEncode(mamasInfo
        .map((e) => {
              'name': e.name.text,
              'occupation': e.occupation.text,
              'contact': e.contactNo.text
            })
        .toList());
    await shared_storage.write(key: "mamas_info", value: mamasInf);

    String sistersInf = jsonEncode(sistersInfo
        .map((e) => {
              'name': e.name.text,
              'occupation': e.occupation.text,
              'marital_status': e.maritalStatus.text
            })
        .toList());
    await shared_storage.write(key: "sisters_info", value: sistersInf);

    String brothersInf = jsonEncode(brothersInfo
        .map((e) => {
              'name': e.name.text,
              'occupation': e.occupation.text,
              'marital_status': e.maritalStatus.text
            })
        .toList());
    await shared_storage.write(key: "brothers_info", value: brothersInf);
  }

  List<Map<String, String>> getMamasDetails() {
    List<Map<String, String>> mama = [];

    for (MamaDetails i in mamasInfo) {
      mama.add({
        "name": i.name.text,
        "contact_no": i.contactNo.text,
        "occupation": i.occupation.text
      });
    }

    return mama;
  }

  List<Map<String, String>> getBrothersDetails() {
    List<Map<String, String>> brothers = [];

    for (var i in brothersInfo) {
      brothers.add({
        "name": i.name.text,
        "occupation": i.occupation.text,
        "marital_status": i.maritalStatus.text
      });
    }

    return brothers;
  }

  List<Map<String, String>> getSistersDetails() {
    List<Map<String, String>> sisters = [];

    for (var i in sistersInfo) {
      sisters.add({
        "name": i.name.text,
        "occupation": i.occupation.text,
        "marital_status": i.maritalStatus.text
      });
    }

    return sisters;
  }
}
