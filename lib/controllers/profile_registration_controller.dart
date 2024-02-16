import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/shared_storage.dart';
import 'package:reshimgathi/services/store_user_data.dart';
import 'package:reshimgathi/services/upload_files.dart';

class ProfileRegistrationController extends ChangeNotifier {
  final personalDetails = PersonalDataModel();
  final professionalDetails = ProfessionalDataModel();
  final familyDetails = FamilyDataModel();
  final residentialDetails = ResidentialDataModel();
  final contactDetails = ContactDataModel();
  final expectations = ExpectationDataModel();
  final images = PickedImages();
  final documents = PickedDocuments();

  final picker = ImagePicker();
  bool isLoading = false;
  final registrationStatus = RegistrationStatusModel();
  bool tAndC = false;

  ProfileRegistrationController() {
    fetchProfileStatus();
    fetchDropDowns();
  }

  fetchProfileStatus() async {
    registrationStatus.personal =
        await shared_storage.read(key: 'r_personal') ?? "";
    registrationStatus.professional =
        await shared_storage.read(key: 'r_professional') ?? "";
    registrationStatus.family =
        await shared_storage.read(key: 'r_family') ?? "";
    registrationStatus.residential =
        await shared_storage.read(key: 'r_residential') ?? "";
    registrationStatus.contact =
        await shared_storage.read(key: 'r_contact') ?? "";
    registrationStatus.expectations =
        await shared_storage.read(key: 'r_expectations') ?? "";
    registrationStatus.photos =
        await shared_storage.read(key: 'r_photos') ?? "";
    registrationStatus.documents =
        await shared_storage.read(key: 'r_documents') ?? "";
    notifyListeners();
  }

  fetchDropDowns() async {
    final pref = await SecureSharedPref.getInstance();
    familyDetails.noOfBrother = await pref.getInt('noOfBrother') ?? 0;
    familyDetails.noOfSister = await pref.getInt('noOfSister') ?? 0;
    familyDetails.noOfMama = await pref.getInt('noOfMama') ?? 0;
    notifyListeners();
  }

  updateRegistrationStatus(val) async {
    registrationStatus.store(val);
    notifyListeners();
  }

  // notifyListeners();

  set setTermsAndConditions(val) {
    tAndC = val;
    notifyListeners();
  }

  set loading(bool val) {
    isLoading = val;
    notifyListeners();
  }

  set updatePhysicalDisabilities(String value) {
    personalDetails.isPhysicallyDissabled = value;
    notifyListeners();
  }

  set setBrotherCount(int value) {
    familyDetails.noOfBrother = value;
    familyDetails.brothersInfo =
        List.generate(value, (index) => SibblingsDetails());
    notifyListeners();
  }

  set setMamaCount(int value) {
    familyDetails.noOfMama = value;
    familyDetails.mamasInfo = List.generate(value, (index) => MamaDetails());
    notifyListeners();
  }

  set setSisterCount(int val) {
    familyDetails.noOfSister = val;
    familyDetails.sistersInfo =
        List.generate(val, (index) => SibblingsDetails());
    notifyListeners();
  }

  pickImages() async {
    List<XFile> pickedImages = await picker.pickMultiImage(imageQuality: 70);
    if (pickedImages.length != 0) {
      for (XFile image in pickedImages) {
        if (images.images!.length <= 3) {
          images.images!.add(image);
          notifyListeners();
        } else {
          break;
        }
      }
    }
  }

  removeImage(int index) {
    images.images!.removeAt(index);
    notifyListeners();
  }

  pickCasteCertificate() async {
    XFile? pickedDoc = await picker.pickImage(source: ImageSource.gallery);
    if (pickedDoc != null) {
      documents.leavingCertificate = pickedDoc;
      notifyListeners();
    }
  }

  pickAdharCard() async {
    XFile? pickedDoc = await picker.pickImage(source: ImageSource.gallery);
    if (pickedDoc != null) {
      documents.adharCard = pickedDoc;
      notifyListeners();
    }
  }

  submitUserDetails() async {
    loading = true;
    await UserRegistrationApi.SubmitUserDetails(
        personal: personalDetails,
        professional: professionalDetails,
        family: familyDetails,
        residential: residentialDetails,
        contact: contactDetails,
        expection: expectations);
    await FireStorage.uploadImages(images);
    await FireStorage.UploadDocuments(documents);
    loading = false;
  }
}
