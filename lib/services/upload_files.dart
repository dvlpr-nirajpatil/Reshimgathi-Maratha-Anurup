import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:reshimgathi/consts/consts.dart';

class FireStorage {
  static Future<String> fileUpload(XFile doc, pat) async {
    File file = File(doc.path);
    // Get the file name
    var fileName = path.basename(file.path);
    Reference storageReference =
        FirebaseStorage.instance.ref().child('${user!.uid}/$pat/$fileName');
    await storageReference.putFile(file);
    // Get the download URL of the uploaded file
    String downloadURL = await storageReference.getDownloadURL();
    return downloadURL;
  }

  static Future<void> uploadImages(PickedImages images) async {
    List<String> uploadedImagesUrl = [];
    try {
      for (XFile image in images.images!) {
        File file = File(image.path);
        // Get the file name
        String fileName = path.basename(file.path);
        Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('${user!.uid}/images/$fileName');
        await storageReference.putFile(file);
        // Get the download URL of the uploaded file
        String downloadURL = await storageReference.getDownloadURL();

        uploadedImagesUrl.add(downloadURL);
      }

      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        userData['images'] = uploadedImagesUrl;

        userData['registration_status']['upload_images'] = true;

        await database
            .collection(registerCollection)
            .doc(user!.uid)
            .update(userData);
      }
    } catch (e) {
      print(e);
    }
  }

  static UploadDocuments(PickedDocuments documents) async {
    try {
      DateTime dateTime = DateTime.now();
      String day = dateTime.day.toString().padLeft(2, '0');
      String month = dateTime.month.toString().padLeft(2, '0');
      String year = dateTime.year.toString();
      String hour = dateTime.hour.toString().padLeft(2, '0');
      String minute = dateTime.minute.toString().padLeft(2, '0');

      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        String? adharUrl = await fileUpload(documents.adharCard!, "documents");
        String? casteProof =
            await fileUpload(documents.leavingCertificate!, "documents");
        userData['documents'] = {
          "adhar_card": adharUrl,
          "caste_proof": casteProof
        };

        userData['registration_status']['upload_docs'] = true;
        userData['profile_status']['registration'] = true;
        userData['registration_date'] = "$day-$month-$year  $hour:$minute";

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
