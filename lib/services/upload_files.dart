import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:reshimgathi/consts/firebase_consts.dart';

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

  static Future<void> uploadImages(List<XFile> images) async {
    List<String> uploadedImagesUrl = [];
    try {
      for (XFile image in images) {
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

  static UploadDocuments(XFile adhar, XFile caste) async {
    try {
      DocumentSnapshot documentSnapshot =
          await database.collection(registerCollection).doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Map<String, dynamic> userData =
            documentSnapshot.data() as Map<String, dynamic>;

        userData['documents'] = {
          "adhar_card": await fileUpload(adhar, "documents"),
          "caste_proof": await fileUpload(caste, "documents")
        };

        userData['registration_status']['upload_docs'] = true;
        userData['profile_status']['registration'] = true;

        await database
            .collection(registerCollection)
            .doc(user!.uid)
            .update(userData);

        print("uploaded successfully");
      }
    } catch (e) {
      print(e);
    }
  }
}
