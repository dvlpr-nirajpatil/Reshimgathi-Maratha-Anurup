import 'package:image_picker/image_picker.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/mamasDetailsModel.dart';
import 'package:reshimgathi/models/siblingsDetailsModel.dart';

class ProfileRegisterModel extends ChangeNotifier {
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
  String selectedPhysicalDisabilities = "No";
  String? selectedCaste = "Maratha 96k";

  // Professional information screeen variable
  TextEditingController educationController = TextEditingController();
  TextEditingController occupationController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController joblocationController = TextEditingController();
  TextEditingController annualincomeController = TextEditingController();

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
  List<SibblingsDetails> sistersInfo = [];
  List<SibblingsDetails> brothersInfo = [];
  List<MamaDetails> mamasInfo = [];
  String? isFatherAlive;
  String? isMotherAlive;
  int noOfBrother = 0;
  int noOfSister = 0;
  int noOfMama = 0;

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
  String? prefferedMaritalStatusSelector;
  String? prefferedMangalAcceptedSelector;
  String? prefferedHandicapedSelector;

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
        "name": i.name!,
        "occupation": i.occupation!,
        "marital_status": i.maritalStatus!
      });
    }

    return sisters;
  }

  List<Map<String, String>> getBrothersDetails() {
    List<Map<String, String>> brothers = [];

    for (var i in brothersInfo) {
      brothers.add({
        "name": i.name!,
        "occupation": i.occupation!,
        "marital_status": i.maritalStatus!
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
