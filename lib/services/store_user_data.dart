import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/utility/util_functions.dart';

class UserRegistrationApi {
  // static Future<void> storePersonalDetails(ProfileRegisterModel model) async {
  //   try {
  //     DocumentSnapshot documentSnapshot = await database
  //         .collection(registerCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> userData =
  //           documentSnapshot.data() as Map<String, dynamic>;
  //       userData['first_name'] = model.firstNameController.text;
  //       userData['last_name'] = model.lastNameController.text;
  //       userData['gender'] = model.selectedGender!;
  //       userData['birth_date'] = model.birthDateController.text;
  //       userData['birth_time'] = model.birthTimeController.text;
  //       userData['birth_name'] = model.birthNameController.text;
  //       userData['birth_place'] = model.birthPlaceController.text;
  //       userData['birth_place'] = model.birthPlaceController.text;
  //       userData['ras'] = model.selectedRas;
  //       userData['height'] = {
  //         'feet': model.heightInFeetController.text,
  //         'inch': model.heightInInchesController.text,
  //       };
  //       userData['blood_group'] = model.selectedBloodGrp;
  //       userData['caste'] = model.selectedCaste;
  //       userData['marital_status'] = model.selectedMaritalStatus;
  //       userData['physical_disability'] = model.selectedPhysicalDisabilities;
  //       userData['physical_disability_detail'] =
  //           model.physicalDisabilityController.text;
  //       userData['registration_status']['personal'] = true;

  //       await database
  //           .collection(registerCollection)
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .update(userData);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // static Future<void> storeProfessionalDetails(
  //     ProfileRegisterModel model) async {
  //   try {
  //     DocumentSnapshot documentSnapshot = await database
  //         .collection(registerCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> userData =
  //           documentSnapshot.data() as Map<String, dynamic>;
  //       userData['education'] = model.educationController.text;
  //       userData['occupation'] = model.occupationController.text;
  //       userData['comopany_or_business_name'] = model.companyController.text;
  //       userData['job_location'] = model.joblocationController.text;
  //       userData['annual_income'] = model.annualincomeController.text;
  //       userData['registration_status']['professional'] = true;

  //       await database
  //           .collection(registerCollection)
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .update(userData);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // static Future<void> storeFamilyDetails(ProfileRegisterModel model) async {
  //   try {
  //     DocumentSnapshot documentSnapshot = await database
  //         .collection(registerCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> userData =
  //           documentSnapshot.data() as Map<String, dynamic>;

  //       userData['father_name'] = model.fatherNameController.text;

  //       userData['father_occupation'] = model.fatherOccupationController.text;
  //       userData['mother_name'] = model.motherNameController.text;

  //       userData['mother_occupation'] = model.motherOccupationController.text;
  //       userData['guardian_name'] = model.guardianNameController.text;
  //       userData['sisters_info'] = model.getSistersDetails();
  //       userData['brothers_info'] = model.getBrothersDetails();
  //       userData['mamas_info'] = model.getMamasDetails();
  //       userData['registration_status']['family'] = true;

  //       await database
  //           .collection(registerCollection)
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .update(userData);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // static Future<void> storeResidentialInformation(
  //     ProfileRegisterModel model) async {
  //   try {
  //     DocumentSnapshot documentSnapshot = await database
  //         .collection(registerCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> userData =
  //           documentSnapshot.data() as Map<String, dynamic>;

  //       userData['address-1'] = model.addressLine1ResidentialController.text;
  //       userData['area'] = model.areaResidentialController.text;
  //       userData['landkmark'] = model.landmarkResidentialController.text;
  //       userData['city'] = model.cityResidentialController.text;
  //       userData['state'] = model.stateResidentialController.text;
  //       userData['pincode'] = model.pincodeResidentialController.text;

  //       userData['registration_status']['residential'] = true;

  //       await database
  //           .collection(registerCollection)
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .update(userData);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // static Future<void> storeContactInformation(
  //     ProfileRegisterModel model) async {
  //   try {
  //     DocumentSnapshot documentSnapshot = await database
  //         .collection(registerCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> userData =
  //           documentSnapshot.data() as Map<String, dynamic>;

  //       userData['father_contact_no'] = model.fatherContactNoController.text;
  //       userData['mother_contact_no'] = model.motherContactNoController.text;
  //       userData['whatsappno'] = model.whatsappNumberController.text;
  //       userData['email'] = model.emailAddressController.text;

  //       userData['registration_status']['contact'] = true;

  //       await database
  //           .collection(registerCollection)
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .update(userData);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // static Future<void> storeExpectationInfo(ProfileRegisterModel model) async {
  //   try {
  //     DocumentSnapshot documentSnapshot = await database
  //         .collection(registerCollection)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> userData =
  //           documentSnapshot.data() as Map<String, dynamic>;

  //       userData['expectations'] = {
  //         "education": model.expectedEducationController.text,
  //         "height": {
  //           "feet": model.prefferedHeightInFeetController.text,
  //           "inch": model.prefferedHeightInInchesController.text
  //         },
  //         "occupation": model.prefferedOccupationController.text,
  //         "location": model.prefferedLocationController.text,
  //         "age_diff": model.prefferedMaxAgeDifferenceController.text,
  //         "marital_status": model.prefferedMaritalStatusSelector,
  //         "managal_accepted": model.prefferedMangalAcceptedSelector,
  //         "handicap_accepted": model.prefferedHandicapedSelector,
  //       };

  //       userData['registration_status']['expectations'] = true;

  //       await database
  //           .collection(registerCollection)
  //           .doc(FirebaseAuth.instance.currentUser!.uid)
  //           .update(userData);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  static SubmitUserDetails({
    required PersonalDataModel personal,
    required ProfessionalDataModel professional,
    required FamilyDataModel family,
    required ResidentialDataModel residential,
    required ContactDataModel contact,
    required ExpectationDataModel expection,
  }) async {
    try {
      DocumentSnapshot documentSnapshot = await database
          .collection(registerCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        // personal Information
        userData['first_name'] = personal.firstName.text;
        userData['last_name'] = personal.lastName.text;
        userData['gender'] = personal.gender!;
        userData['birth_date'] = personal.birthDate.text;
        userData['birth_time'] = personal.birthTime.text;
        userData['birth_name'] = personal.birthName.text;
        userData['birth_place'] = personal.birthPlace.text;

        userData['ras'] = personal.ras;
        userData['height'] = {
          'feet': personal.heightInFeet.text,
          'inch': personal.heightInInches.text,
        };
        userData['blood_group'] = personal.bloodGroup;
        userData['caste'] = personal.caste;
        userData['marital_status'] = personal.maritalStatus;
        userData['physical_disability'] = personal.isPhysicallyDissabled;
        userData['physical_disability_detail'] =
            personal.physicalDisability.text;

        // professional Information

        userData['education'] = professional.education.text;
        userData['occupation'] = professional.occupation.text;
        userData['comopany_or_business_name'] = professional.company.text;
        userData['job_location'] = professional.joblocation.text;
        userData['annual_income'] = professional.annualincome.text;

        // family background
        userData['father_name'] = family.fatherName.text;
        userData['father_occupation'] = family.fatherOccupation.text;
        userData['mother_name'] = family.motherName.text;

        userData['mother_occupation'] = family.motherOccupation.text;

        userData['sisters_info'] = family.getSistersDetails();
        userData['brothers_info'] = family.getBrothersDetails();
        userData['mamas_info'] = family.getMamasDetails();

        // residential information
        userData['address-1'] = residential.address.text;
        userData['area'] = residential.area.text;
        userData['landkmark'] = residential.landmark.text;
        userData['city'] = residential.city.text;
        userData['state'] = residential.state.text;
        userData['pincode'] = residential.pincode.text;

        //contact details
        userData['father_contact_no'] = contact.fatherContactNo.text;
        userData['mother_contact_no'] = contact.motherContactNo.text;
        userData['whatsappno'] = contact.whatsappNumber.text;
        userData['email'] = contact.emailAddress.text;

        //expectations
        userData['expectations'] = {
          "education": expection.education.text,
          "height": {
            "feet": expection.heightInFeet.text,
            "inch": expection.heightInInches.text
          },
          "occupation": expection.occupation.text,
          "location": expection.location.text,
          "age_diff": expection.maxAgeDifference.text,
          "marital_status": expection.maritalStatus,
          "managal_accepted": expection.mangalAccepted,
          "handicap_accepted": expection.handicap,
        };

        userData['profile_status']['registration'] = true;
        userData['registration_date'] = getDateInString();

        userData['profile_status']['registration'] = true;

        await database
            .collection(registerCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }

  static verifyUser(paymentId, orderId) async {
    try {
      DocumentSnapshot documentSnapshot = await database
          .collection(registerCollection)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        userData['profile_status']['membership_active'] = true;
        userData['payment_details'] = {
          'payment_id': paymentId,
          'payment_date': getDateInString(),
          'order_id': orderId
        };

        await database
            .collection(registerCollection)
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }
}
