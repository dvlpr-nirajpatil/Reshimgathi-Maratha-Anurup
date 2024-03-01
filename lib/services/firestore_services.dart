import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reshimgathi/consts/firebase_consts.dart';

class FirestoreServices {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getUser() {
    return database
        .collection(registerCollection)
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  static Future<List<DocumentSnapshot>> searchUsers(String searchString) async {
    Set<String> uniqueDocumentIds = <String>{};
    var usersCollection = database.collection(registerCollection);
    List<QuerySnapshot> querySnapshots = await Future.wait([
      usersCollection
          .where('first_name', isGreaterThanOrEqualTo: searchString)
          .where('first_name', isLessThan: searchString + 'z')
          .get(),
      usersCollection
          .where('last_name', isGreaterThanOrEqualTo: searchString)
          .where('last_name', isLessThan: searchString + 'z')
          .get(),
      usersCollection
          .where('marital_status', isGreaterThanOrEqualTo: searchString)
          .where('marital_status', isLessThan: searchString + 'z')
          .get(),
      usersCollection
          .where('education', isGreaterThanOrEqualTo: searchString)
          .where('education', isLessThan: searchString + 'z')
          .get(),
      usersCollection
          .where('occupation', isGreaterThanOrEqualTo: searchString)
          .where('occupation', isLessThan: searchString + 'z')
          .get(),
      usersCollection
          .where('city', isGreaterThanOrEqualTo: searchString)
          .where('city', isLessThan: searchString + 'z')
          .get(),
    ]);

    List<DocumentSnapshot> results = [];

    for (var snapshot in querySnapshots) {
      for (var doc in snapshot.docs) {
        if (!uniqueDocumentIds.contains(doc.id)) {
          uniqueDocumentIds.add(doc.id);
          results.add(doc);
        }
      }
    }

    return results;
  }
}
