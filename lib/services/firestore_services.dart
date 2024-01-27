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
}
