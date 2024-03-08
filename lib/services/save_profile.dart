import 'package:flutter/foundation.dart';
import 'package:reshimgathi/consts/consts.dart';

class SaveProfileService {
  static Future<void> saveProfile({uid, data}) async {
    try {
      // Get a reference to the Firestore instance
      print(data);
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get a reference to the specific document in the collection
      DocumentReference documentReference = firestore
          .collection('savedProfiles')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      // Get the current data from the document
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (documentSnapshot.data() == null) {
        firestore
            .collection('savedProfiles')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(
          {
            'savedProfiles': {uid: data}
          },
        );
      } else {
        Map<String, dynamic> currentData =
            documentSnapshot.data() as Map<String, dynamic>;

        // Get the "saved profiles" array or initialize it if it doesn't exist
        currentData['savedProfiles'][uid] = data;

        // Add the new profile to the array

        // Update the document with the modified data
        await documentReference.update(currentData);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error adding profile: $e');
      }
    }
  }

  static Future<void> unsaveProfile({uid}) async {
    try {
      // Get a reference to the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Get a reference to the specific document in the collection
      DocumentReference documentReference = firestore
          .collection('savedProfiles')
          .doc(FirebaseAuth.instance.currentUser!.uid);

      // Get the current data from the document
      DocumentSnapshot documentSnapshot = await documentReference.get();

      Map<String, dynamic> currentData =
          documentSnapshot.data() as Map<String, dynamic>;

      // Get the "saved profiles" array or initialize it if it doesn't exist
      currentData['savedProfiles'].remove(uid);

      // Add the new profile to the array

      // Update the document with the modified data
      await documentReference.update(currentData);
    } catch (e) {
      if (kDebugMode) {
        print('Error Deleting profile: $e');
      }
    }
  }
}
