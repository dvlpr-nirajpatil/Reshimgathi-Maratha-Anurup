import 'package:image_picker/image_picker.dart';
import 'package:reshimgathi/consts/consts.dart';

class ProfileRegistrationController extends ChangeNotifier {
  // ignore: non_constant_identifier_names

  // personal information screen variable
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController birthTimeController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController heightInFeetController = TextEditingController();
  TextEditingController heightInInchesController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController physicalDisabilityController = TextEditingController();
  String? selectedGender;
  String? selectedBloodGrp;
  String? selectedMaritalStatus;
  String selectedPhysicalDisabilities = "No";
  String? selectedCaste = "Maratha 96k";
  set updateSelectedGender(String value) {
    selectedGender = value;
    notifyListeners();
  }

  set updateBloodGrp(String value) {
    selectedBloodGrp = value;
    notifyListeners();
  }

  set updateMaterialStatus(String value) {
    selectedMaritalStatus = value;
    notifyListeners();
  }

  set updatePhysicalDisabilities(String value) {
    selectedPhysicalDisabilities = value;
    notifyListeners();
  }

  set updateCaste(String value) {
    selectedCaste = value;
    notifyListeners();
  }

  // professional information Screen variable
  TextEditingController educationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();

  // Family background information Screen variable
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController fatherIsAliveController = TextEditingController();
  TextEditingController fatherOccupationController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController motherIsAliveController = TextEditingController();
  TextEditingController motherOccupationController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController brotherCountController = TextEditingController();
  TextEditingController sisterCountController = TextEditingController();
  TextEditingController mamaCountController = TextEditingController();
  String? isFatherAlive;
  String? isMotherAlive;
  int noOfBrother = 0;
  int noOfSister = 0;
  int noOfMama = 0;
  set setBrotherCount(int value) {
    noOfBrother = value;
    notifyListeners();
  }

  set setMamaCount(int value) {
    noOfMama = value;
    notifyListeners();
  }

  set setSisterCount(int val) {
    noOfSister = val;
    notifyListeners();
  }

  set setIsFatherAlive(String value) {
    isFatherAlive = value;
    notifyListeners();
  }

  set setIsMotherAlive(String value) {
    isMotherAlive = value;
    notifyListeners();
  }

  // Residential information Screen variable
  TextEditingController addressLine1ResidentialController =
      TextEditingController();
  TextEditingController areaResidentialController = TextEditingController();
  TextEditingController landmarkResidentialController = TextEditingController();
  TextEditingController cityResidentialController = TextEditingController();
  TextEditingController stateResidentialController = TextEditingController();
  TextEditingController pincodeResidentialController = TextEditingController();

  // Contact information Screen variable
  TextEditingController fatherContactNoController = TextEditingController();
  TextEditingController motherContactNoController = TextEditingController();
  TextEditingController whatsappNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();

  // Expections information Screen variable
  TextEditingController prefferedHeightInFeetController =
      TextEditingController();
  TextEditingController prefferedHeightInInchesController =
      TextEditingController();
  TextEditingController prefferedMaxAgeDifferenceController =
      TextEditingController();
  TextEditingController expectedEducationController = TextEditingController();
  TextEditingController prefferedOccupationController = TextEditingController();
  TextEditingController prefferedLocationController = TextEditingController();
  TextEditingController prefferedMaritalStatusController =
      TextEditingController();
  TextEditingController prefferedMangalAcceptedController =
      TextEditingController();
  TextEditingController prefferedHandicapedController = TextEditingController();

  // Upload document information Screen variable
  List<XFile>? uploadImages = [];
  final picker = ImagePicker();
  var documentImage;
  TextEditingController castCertificateSerialNoController =
      TextEditingController();

  pickImages() async {
    List<XFile> pickedImages = await picker.pickMultiImage();

    if (pickedImages.length != 0) {
      uploadImages!.addAll(pickedImages);
      notifyListeners();
    }
  }

  removeImage(int index) {
    uploadImages!.removeAt(index);
    notifyListeners();
  }

  removeDoc() {
    documentImage.removeImage();
    notifyListeners();
  }

  pickDocument() async {
    XFile? pickedDoc = await picker.pickImage(source: ImageSource.gallery);
    if (pickedDoc != null) {
      documentImage = pickedDoc;
      notifyListeners();
    }
  }
}
