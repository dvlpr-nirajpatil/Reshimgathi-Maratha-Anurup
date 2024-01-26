import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/profile_registration_model.dart';

class UserRegistrationApi {
  static Future<void> storePersonalDetails(ProfileRegisterModel model) async {
    try {
      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;
        userData['first_name'] = model.firstNameController.text;
        userData['last_name'] = model.lastNameController.text;
        userData['gender'] = model.selectedGender!;
        userData['birth_date'] = model.birthDateController.text;
        userData['birth_time'] = model.birthTimeController.text;
        userData['birth_name'] = model.birthNameController.text;
        userData['birth_place'] = model.birthPlaceController.text;
        userData['birth_place'] = model.birthPlaceController.text;
        userData['ras'] = model.rasController.text;
        userData['height'] = {
          'feet': model.heightInFeetController.text,
          'inch': model.heightInInchesController.text,
        };
        userData['blood_group'] = model.selectedBloodGrp;
        userData['caste'] = model.selectedCaste;
        userData['marital_status'] = model.selectedMaritalStatus;
        userData['physical_disability'] = model.selectedPhysicalDisabilities;
        userData['physical_disability_detail'] =
            model.physicalDisabilityController.text;
        userData['registration_status']['personal'] = true;

        await database
            .collection(registerCollection)
            .doc(user!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> storeProfessionalDetails(
      ProfileRegisterModel model) async {
    try {
      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;
        userData['education'] = model.educationController.text;
        userData['occupation'] = model.occupationController.text;
        userData['comopany_or_business_name'] = model.companyController.text;
        userData['job_location'] = model.joblocationController.text;
        userData['annual_income'] = model.annualincomeController.text;
        userData['registration_status']['professional'] = true;

        await database
            .collection(registerCollection)
            .doc(user!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> storeFamilyDetails(ProfileRegisterModel model) async {
    try {
      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        userData['father_name'] = model.fatherNameController.text;
        userData['is_father_alive'] = model.isFatherAlive;
        userData['father_occupation'] = model.fatherOccupationController.text;
        userData['mother_name'] = model.motherNameController.text;
        userData['is_mother_alive'] = model.isMotherAlive;
        userData['mother_occupation'] = model.motherOccupationController.text;
        userData['guardian_name'] = model.guardianNameController.text;
        userData['sisters_info'] = model.getSistersDetails();
        userData['brothers_info'] = model.getBrothersDetails();
        userData['mamas_info'] = model.getMamasDetails();
        userData['registration_status']['family'] = true;

        await database
            .collection(registerCollection)
            .doc(user!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> storeResidentialInformation(
      ProfileRegisterModel model) async {
    try {
      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        userData['address-1'] = model.addressLine1ResidentialController.text;
        userData['area'] = model.areaResidentialController.text;
        userData['landkmark'] = model.landmarkResidentialController.text;
        userData['city'] = model.cityResidentialController.text;
        userData['state'] = model.stateResidentialController.text;
        userData['pincode'] = model.pincodeResidentialController.text;

        userData['registration_status']['residential'] = true;

        await database
            .collection(registerCollection)
            .doc(user!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> storeContactInformation(
      ProfileRegisterModel model) async {
    try {
      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        userData['father_contact_no'] = model.fatherContactNoController.text;
        userData['mother_contact_no'] = model.motherContactNoController.text;
        userData['whatsappno'] = model.whatsappNumberController.text;
        userData['email'] = model.emailAddressController.text;

        userData['registration_status']['contact'] = true;

        await database
            .collection(registerCollection)
            .doc(user!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> storeExpectationInfo(ProfileRegisterModel model) async {
    try {
      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        userData['expectations'] = {
          "education": model.expectedEducationController.text,
          "height": {
            "feet": model.prefferedHeightInFeetController.text,
            "inch": model.prefferedHeightInInchesController.text
          },
          "occupation": model.prefferedOccupationController.text,
          "location": model.prefferedLocationController.text,
          "age_diff": model.prefferedMaxAgeDifferenceController.text,
          "marital_status": model.prefferedMaritalStatusSelector,
          "managal_accepted": model.prefferedMangalAcceptedSelector,
          "handicap_accepted": model.prefferedHandicapedSelector,
        };

        userData['registration_status']['expectations'] = true;

        await database
            .collection(registerCollection)
            .doc(user!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }
}
