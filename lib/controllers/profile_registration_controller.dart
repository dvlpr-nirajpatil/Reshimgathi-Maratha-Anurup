import 'package:image_picker/image_picker.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/mamasDetailsModel.dart';
import 'package:reshimgathi/models/profile_registration_model.dart';
import 'package:reshimgathi/models/siblingsDetailsModel.dart';
import 'package:reshimgathi/services/store_user_data.dart';
import 'package:reshimgathi/services/upload_files.dart';

class ProfileRegistrationController extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  final model = ProfileRegisterModel();
  final picker = ImagePicker();

  bool is_loading = false;

  set loading(bool val) {
    is_loading = val;
    notifyListeners();
  }

  set updateRas(String value) {
    model.selectedRas = value;
    notifyListeners();
  }

  set updateSelectedGender(String value) {
    model.selectedGender = value;
    notifyListeners();
  }

  set updateBloodGrp(String value) {
    model.selectedBloodGrp = value;
    notifyListeners();
  }

  set updateMaterialStatus(String value) {
    model.selectedMaritalStatus = value;
    notifyListeners();
  }

  set updatePhysicalDisabilities(String value) {
    model.selectedPhysicalDisabilities = value;
    notifyListeners();
  }

  set updateCaste(String value) {
    model.selectedCaste = value;
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

  set setIsFatherAlive(String value) {
    model.isFatherAlive = value;
    notifyListeners();
  }

  set setIsMotherAlive(String value) {
    model.isMotherAlive = value;
    notifyListeners();
  }

  pickImages() async {
    List<XFile> pickedImages = await picker.pickMultiImage();

    if (pickedImages.length != 0) {
      model.uploadImages!.addAll(pickedImages);
      notifyListeners();
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

  set setPreferedMaritalStatus(String val) {
    model.prefferedMaritalStatusSelector = val;
    notifyListeners();
  }

  set setPreferedMangal(String val) {
    model.prefferedMangalAcceptedSelector = val;
    notifyListeners();
  }

  set setPreferedHandicaped(String val) {
    model.prefferedHandicapedSelector = val;
    notifyListeners();
  }

  storePersonalDetails() async {
    loading = true;
    await UserRegistrationApi.storePersonalDetails(model);
    loading = false;
  }

  storeProfessionalDetails() async {
    loading = true;
    await UserRegistrationApi.storeProfessionalDetails(model);
    loading = false;
  }

  storeFamilyDetails() async {
    loading = true;
    await UserRegistrationApi.storeFamilyDetails(model);
    loading = false;
  }

  storeResidentialInformation() async {
    loading = true;
    await UserRegistrationApi.storeResidentialInformation(model);
    loading = false;
  }

  storeContactInformation() async {
    loading = true;
    await UserRegistrationApi.storeContactInformation(model);
    loading = false;
  }

  storeExpectationInfo() async {
    loading = true;
    await UserRegistrationApi.storeExpectationInfo(model);
    loading = false;
  }

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
