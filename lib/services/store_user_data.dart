import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/utility/util_functions.dart';

class UserRegistrationApi {
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
        userData['mama_native_place'] = family.mamaNativePlace.text;

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
