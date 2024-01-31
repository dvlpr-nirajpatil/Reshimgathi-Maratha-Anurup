import 'package:image_picker/image_picker.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/mamasDetailsModel.dart';
import 'package:reshimgathi/models/siblingsDetailsModel.dart';

class ProfileRegisterModel extends ChangeNotifier {
  // constructor
  ProfileRegisterModel() {
    fetchData();
  }

  fetchData() async {
    await _fetchProfessionalDetailsFromPref();
    await _fetchfamilyDetailsFromPref();
    await _fetchresidentialDetailsFromPref();
    await _fetchContactInfoFromPref();
    await _fetchExpectionInfoFromPref();
  }

  bool? registraionScreen;

  bool? professionalScreen;
  bool? familyBackgroundScreen;
  bool? residentialScreen;
  bool? contactScreen;
  bool? uploadPhotoScreen;
  bool? uploadDocumentScreen;
  bool? expectionScreen;

  fetchRegistrationStatus() async {
    var pref = await SecureSharedPref.getInstance();
    registraionScreen = await pref.getBool('registraionScreen') ?? false;

    professionalScreen = await pref.getBool('prefessionalScreen') ?? false;
    familyBackgroundScreen =
        await pref.getBool('familyBackgroundScreen') ?? false;
    residentialScreen = await pref.getBool('residentialScreen') ?? false;
    contactScreen = await pref.getBool('contactScreen') ?? false;
    uploadPhotoScreen = await pref.getBool('uploadPhotoScreen') ?? false;
    uploadDocumentScreen = await pref.getBool('uploadDocumentScreen') ?? false;
    expectionScreen = await pref.getBool('expectionScreen') ?? false;
  }

  storeProfessionalScreenStatus() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putBool('professionalScreen', true);
  }

  storeFamilyBackgroundScreenStatus() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putBool('familyBackgroundScreen', true);
  }

  storeResidentialScreenStatus() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putBool('residentialScreen', true);
  }

  storeContactScreenStatus() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putBool('contactScreen', true);
  }

  storeExpectionScreenStatus() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putBool('expectionScreen', true);
  }

  storeUploadPhotoScreenStatus() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putBool('uploadPhotoScreen', true);
  }

  storeUploadDocScreenStatus() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putBool('uploadDocumentScreen', true);
  }

  // personal information screen variable
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController birthTimeController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController birthNameController = TextEditingController();
  TextEditingController rasController = TextEditingController();
  TextEditingController heightInFeetController = TextEditingController();
  TextEditingController heightInInchesController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController casteController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();

  TextEditingController physicalDisabilityController = TextEditingController();
  String? selectedGender;
  String? selectedRas;
  String? selectedBloodGrp;
  String? selectedMaritalStatus;
  String? selectedPhysicalDisabilities;
  String? selectedCaste;

  storePersonalDataInPref() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("firstName", firstNameController.text);
    pref.putString("lastName", lastNameController.text);
    pref.putString("gender", selectedGender ?? "");
    pref.putString("birthName", birthNameController.text);
    pref.putString("birthDate", birthDateController.text);
    pref.putString("birthTime", birthTimeController.text);
    pref.putString("birthPlace", birthPlaceController.text);
    pref.putString("feet", heightInFeetController.text);
    pref.putString("inch", heightInInchesController.text);
    pref.putString("bloodGroup", selectedBloodGrp ?? "");
    pref.putString("ras", selectedRas ?? "");
    pref.putString("caste", selectedCaste ?? "");
    pref.putString("maritalStatus", selectedMaritalStatus ?? "");
    pref.putString("physicalDisability", selectedPhysicalDisabilities ?? "");
    pref.putString("physicalDisabilityDSC", physicalDisabilityController.text);
    pref.putBool('registrationScreen', true);
  }

  // Professional information screeen variable
  TextEditingController educationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController joblocationController = TextEditingController();
  TextEditingController annualincomeController = TextEditingController();

  _fetchProfessionalDetailsFromPref() async {
    var pref = await SecureSharedPref.getInstance();
    educationController.text = await pref.getString('education') ?? "";
    occupationController.text = await pref.getString('occupation') ?? "";
    companyController.text = await pref.getString('companyName') ?? "";
    joblocationController.text = await pref.getString('jobLocation') ?? "";
    annualincomeController.text = await pref.getString('annualIncome') ?? "";
  }

  storeProfessionalDataInPref() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("education", educationController.text);
    pref.putString("occupation", occupationController.text);
    pref.putString("companyName", companyController.text);
    pref.putString("jobLocation", joblocationController.text);
    pref.putString("annualIncome", annualincomeController.text);
  }

  // Family background information Screen variable
  TextEditingController fatherNameController = TextEditingController();

  TextEditingController fatherOccupationController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();

  TextEditingController motherOccupationController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController brotherCountController = TextEditingController();
  TextEditingController sisterCountController = TextEditingController();
  TextEditingController mamaCountController = TextEditingController();
  List<SibblingsDetails> sistersInfo = [];
  List<SibblingsDetails> brothersInfo = [];
  List<MamaDetails> mamasInfo = [];
  int noOfBrother = 0;
  int noOfSister = 0;
  int noOfMama = 0;

  TextEditingController mamaNativePlace = TextEditingController();

  _fetchfamilyDetailsFromPref() async {
    var pref = await SecureSharedPref.getInstance();
    fatherNameController.text = await pref.getString('fatherName') ?? "";
    fatherOccupationController.text =
        await pref.getString('fatherOccupation') ?? "";
    motherNameController.text = await pref.getString('motherName') ?? "";
    motherOccupationController.text =
        await pref.getString('motherOccupation') ?? "";
    guardianNameController.text = await pref.getString('guardianName') ?? "";
  }

  storeFamilyDataInPref() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("fatherName", fatherNameController.text);
    pref.putString("fatherOccupation", fatherOccupationController.text);
    pref.putString("motherName", motherNameController.text);
    pref.putString("motherOccupation", motherOccupationController.text);
    pref.putString("guardianName", guardianNameController.text);
    pref.putInt("noOfBrother", noOfBrother);
    pref.putInt("noOfSister", noOfSister);
    pref.putInt("noOfMama", noOfMama);
    pref.putString('mamaNativePlace', mamaNativePlace.text);

    for (int i = 0; i < noOfBrother; i++) {
      pref.putMap("brother$i", {
        'name': brothersInfo[i].name,
        'occupation': brothersInfo[i].occupation,
        'marital_status': brothersInfo[i].maritalStatus,
      });
    }

    for (int i = 0; i < noOfSister; i++) {
      pref.putMap("sister$i", {
        'name': sistersInfo[i].name,
        'occupation': sistersInfo[i].occupation,
        'marital_status': sistersInfo[i].maritalStatus,
      });
    }
    for (int i = 0; i < noOfMama; i++) {
      pref.putMap("mama$i", {
        'name': mamasInfo[i].name,
        'occupation': mamasInfo[i].occupation,
        'contact': mamasInfo[i].contactNo,
      });
    }
  }

  // Residential information Screen variable
  TextEditingController addressLine1ResidentialController =
      TextEditingController();
  TextEditingController areaResidentialController = TextEditingController();
  TextEditingController landmarkResidentialController = TextEditingController();
  TextEditingController cityResidentialController = TextEditingController();
  TextEditingController stateResidentialController = TextEditingController();
  TextEditingController pincodeResidentialController = TextEditingController();

  _fetchresidentialDetailsFromPref() async {
    var pref = await SecureSharedPref.getInstance();
    addressLine1ResidentialController.text =
        await pref.getString("address") ?? "";
    areaResidentialController.text = await pref.getString('area') ?? "";
    landmarkResidentialController.text = await pref.getString("landmark") ?? "";
    cityResidentialController.text = await pref.getString("city") ?? " ";
    stateResidentialController.text = await pref.getString('state') ?? "";
    pincodeResidentialController.text = await pref.getString('pincode') ?? "";
  }

  storeResidentialInfoInPref() async {
    var pref = await SecureSharedPref.getInstance();

    pref.putString("address", addressLine1ResidentialController.text);
    pref.putString("area", areaResidentialController.text);
    pref.putString("landmark", landmarkResidentialController.text);
    pref.putString("city", cityResidentialController.text);
    pref.putString("state", stateResidentialController.text);
    pref.putString("pincode", pincodeResidentialController.text);
  }

  // Contact information Screen variable
  TextEditingController fatherContactNoController = TextEditingController();
  TextEditingController motherContactNoController = TextEditingController();
  TextEditingController whatsappNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();

  _fetchContactInfoFromPref() async {
    var pref = await SecureSharedPref.getInstance();
    fatherContactNoController.text =
        await pref.getString("fatherContact") ?? "";
    motherContactNoController.text =
        await pref.getString("motherContact") ?? "";
    whatsappNumberController.text = await pref.getString("whatsapp") ?? "";
    emailAddressController.text = await pref.getString("emailAddress") ?? "";
  }

  storeContactInfoInPref() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("fatherContact", fatherContactNoController.text);
    pref.putString("mothercontact", motherContactNoController.text);
    pref.putString("whatsapp", whatsappNumberController.text);
    pref.putString("emailAddress", emailAddressController.text);
  }

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
  String? prefferedMaritalStatusSelector;
  String? prefferedMangalAcceptedSelector;
  String? prefferedHandicapedSelector;

  _fetchExpectionInfoFromPref() async {
    var pref = await SecureSharedPref.getInstance();
    prefferedHeightInFeetController.text =
        await pref.getString("xHeightInFeet") ?? "";
    prefferedHeightInInchesController.text =
        await pref.getString("xHeightInInch") ?? "";
    prefferedMaxAgeDifferenceController.text =
        await pref.getString("xMaxAgeDifference") ?? "";
    expectedEducationController.text = await pref.getString("xEducation") ?? "";
    prefferedOccupationController.text =
        await pref.getString("xOccupation") ?? "";
    prefferedLocationController.text = await pref.getString("xLocation") ?? "";
    prefferedMaritalStatusSelector = await pref.getString("xMaritialStatus");
    prefferedMangalAcceptedSelector = await pref.getString("xMangalAccepted");
    prefferedHandicapedSelector = await pref.getString("xHandicaped");
  }

  storeExpectionIncoInPref() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("xHeightInFeet", prefferedHeightInFeetController.text);
    pref.putString("xHeightInInch", prefferedHeightInInchesController.text);
    pref.putString(
        "xMaxAgeDifference", prefferedMaxAgeDifferenceController.text);
    pref.putString("xEducation", expectedEducationController.text);
    pref.putString("xOccupation", prefferedOccupationController.text);
    pref.putString("xLocation", prefferedLocationController.text);
    pref.putString("xMaritialStatus", prefferedMaritalStatusSelector ?? "");
    pref.putString("xMangalAccepted", prefferedMangalAcceptedSelector ?? "");
    pref.putString("xHandicaped", prefferedHandicapedSelector ?? "");
  }

  // Upload Image Screen variable
  List<XFile>? uploadImages = [];

  // Upload document Screen variable
  XFile? casteCertificate;
  XFile? adharCard;
  TextEditingController castCertificateSerialNoController =
      TextEditingController();

  List<Map<String, String>> getSistersDetails() {
    List<Map<String, String>> sisters = [];

    for (var i in sistersInfo) {
      sisters.add({
        // "name": i.name.text,
        // "occupation": i.occupation.text,
        // "marital_status": i.maritalStatus.text
      });
    }

    return sisters;
  }

  List<Map<String, String>> getBrothersDetails() {
    List<Map<String, String>> brothers = [];

    for (var i in brothersInfo) {
      brothers.add({
        // "name": i.name.text,
        // "occupation": i.occupation.text,
        // "marital_status": i.maritalStatus.text
      });
    }

    return brothers;
  }

  List<Map<String, String>> getMamasDetails() {
    List<Map<String, String>> mama = [];

    for (MamaDetails i in mamasInfo) {
      mama.add({
        "name": i.name!,
        "contact_no": i.contactNo!,
        "occupation": i.occupation!
      });
    }

    return mama;
  }
}
