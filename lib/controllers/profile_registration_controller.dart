import 'package:reshimgathi/consts/consts.dart';
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
    var pref = await SecureSharedPref.getInstance();
    registrationStatus.personal = await pref.getBool('r_personal') ?? false;
    registrationStatus.professional =
        await pref.getBool('r_professional') ?? false;
    registrationStatus.family = await pref.getBool('r_family') ?? false;
    registrationStatus.residential =
        await pref.getBool('r_residential') ?? false;
    registrationStatus.contact = await pref.getBool('r_contact') ?? false;
    registrationStatus.expectations =
        await pref.getBool('r_expectations') ?? false;
    registrationStatus.photos = await pref.getBool('r_photos') ?? false;
    registrationStatus.documents = await pref.getBool('r_documents') ?? false;
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
    // await UserRegistrationApi.SubmitUserDetails(
    //     personal: personalDetails,
    //     professional: professionalDetails,
    //     family: familyDetails,
    //     residential: residentialDetails,
    //     contact: contactDetails,
    //     expection: expectations);
    // await FireStorage.uploadImages(images);
    await FireStorage.UploadDocuments(documents);
    loading = false;
  }
}
