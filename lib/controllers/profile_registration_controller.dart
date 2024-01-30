import 'package:image_picker/image_picker.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/mamasDetailsModel.dart';
import 'package:reshimgathi/models/profile_registration_model.dart';
import 'package:reshimgathi/models/registrationStatusModel.dart';
import 'package:reshimgathi/models/siblingsDetailsModel.dart';
import 'package:reshimgathi/services/store_user_data.dart';
import 'package:reshimgathi/services/upload_files.dart';

class ProfileRegistrationController extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  final model = ProfileRegisterModel();
  final picker = ImagePicker();
  bool is_loading = false;
  final registrationStatus = RegistrationStatusModel();

  ProfileRegistrationController() {
    fetchRegistrationStatus();
  }

  bool checkProfileCompleted() {
    return registrationStatus.rPersonal! &&
        registrationStatus.rProfessional! &&
        registrationStatus.rFamily! &&
        registrationStatus.rResidential! &&
        registrationStatus.rContact! &&
        registrationStatus.rExpectations! &&
        registrationStatus.rPhotos! &&
        registrationStatus.rDocuments!;
  }

  updateRegistrationStatus(val) async {
    final pref = await SecureSharedPref.getInstance();
    switch (val) {
      case 1:
        registrationStatus.rPersonal = true;
        await pref.putBool('r_personal', true);
        break;
      case 2:
        registrationStatus.rProfessional = true;
        await pref.putBool('r_professional', true);
        break;
      case 3:
        registrationStatus.rFamily = true;
        await pref.putBool('r_family', true);
        break;
      case 4:
        registrationStatus.rResidential = true;
        await pref.putBool('r_residential', true);
        break;
      case 5:
        registrationStatus.rContact = true;
        await pref.putBool('r_contact', true);
        break;
      case 6:
        registrationStatus.rExpectations = true;
        await pref.putBool('r_expectations', true);
        break;
      case 7:
        registrationStatus.rPhotos = true;
        await pref.putBool('r_photos', true);
        break;
      case 8:
        registrationStatus.rDocuments = true;
        await pref.putBool('r_documents', true);
        break;
    }
    notifyListeners();
  }

  fetchRegistrationStatus() async {
    var pref = await SecureSharedPref.getInstance();
    registrationStatus.rPersonal = await pref.getBool('r_personal') ?? false;
    registrationStatus.rProfessional =
        await pref.getBool('r_professional') ?? false;
    registrationStatus.rFamily = await pref.getBool('r_family') ?? false;
    registrationStatus.rResidential =
        await pref.getBool('r_residential') ?? false;
    registrationStatus.rContact = await pref.getBool('r_contact') ?? false;
    registrationStatus.rExpectations =
        await pref.getBool('r_expectations') ?? false;
    registrationStatus.rPhotos = await pref.getBool('r_photos') ?? false;
    registrationStatus.rDocuments = await pref.getBool('r_documents') ?? false;
    notifyListeners();
  }

  bool tAndC = false;

  set setTermsAndConditions(val) {
    tAndC = val;
    notifyListeners();
  }

  set loading(bool val) {
    is_loading = val;
    notifyListeners();
  }

  set updatePhysicalDisabilities(String value) {
    model.selectedPhysicalDisabilities = value;
    notifyListeners();
  }

  set setBrotherCount(int value) {
    model.noOfBrother = value;
    model.brothersInfo = List.generate(value, (index) => SibblingsDetails());
    notifyListeners();
  }

  set setMamaCount(int value) {
    model.noOfMama = value;
    model.mamasInfo = List.generate(value, (index) => MamaDetails());
    notifyListeners();
  }

  set setSisterCount(int val) {
    model.noOfSister = val;
    model.sistersInfo = List.generate(val, (index) => SibblingsDetails());
    notifyListeners();
  }

  pickImages() async {
    List<XFile> pickedImages = await picker.pickMultiImage(imageQuality: 70);
    if (pickedImages.length != 0) {
      for (XFile image in pickedImages) {
        if (model.uploadImages!.length <= 3) {
          model.uploadImages!.add(image);
          notifyListeners();
        } else {
          break;
        }
      }
    }
  }

  removeImage(int index) {
    model.uploadImages!.removeAt(index);
    notifyListeners();
  }

  pickCasteCertificate() async {
    XFile? pickedDoc = await picker.pickImage(source: ImageSource.gallery);
    if (pickedDoc != null) {
      model.casteCertificate = pickedDoc;
      notifyListeners();
    }
  }

  pickAdharCard() async {
    XFile? pickedDoc = await picker.pickImage(source: ImageSource.gallery);
    if (pickedDoc != null) {
      model.adharCard = pickedDoc;
      notifyListeners();
    }
  }

  submitProfile() async {
    loading = true;
    await UserRegistrationApi.SubmitUserDetails(model);
    loading = false;
  }

  // storePersonalDetails() async {
  //   loading = true;
  //   await UserRegistrationApi.storePersonalDetails(model);
  //   loading = false;
  // }

  // storeProfessionalDetails() async {
  //   loading = true;
  //   await UserRegistrationApi.storeProfessionalDetails(model);
  //   loading = false;
  // }

  // storeFamilyDetails() async {
  //   loading = true;
  //   await UserRegistrationApi.storeFamilyDetails(model);
  //   loading = false;
  // }

  // storeResidentialInformation() async {
  //   loading = true;
  //   await UserRegistrationApi.storeResidentialInformation(model);
  //   loading = false;
  // }

  // storeContactInformation() async {
  //   loading = true;
  //   await UserRegistrationApi.storeContactInformation(model);
  //   loading = false;
  // }

  // storeExpectationInfo() async {
  //   loading = true;
  //   await UserRegistrationApi.storeExpectationInfo(model);
  //   loading = false;
  // }

  storeImages() async {
    loading = true;
    await FireStorage.uploadImages(model.uploadImages!);
    loading = false;
  }

  storeDocuments() async {
    loading = true;
    await FireStorage.UploadDocuments(
        model.adharCard!, model.casteCertificate!);
    loading = false;
  }
}
