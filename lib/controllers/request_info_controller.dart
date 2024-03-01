import 'dart:async';

import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/utility/util_functions.dart';

class RequestInfoController extends ChangeNotifier {
  int selectedOptionIndex = 0;
  List options = ['accepted', 'pending'];

  StreamSubscription<DocumentSnapshot>? _subscription;

  set setOption(int val) {
    selectedOptionIndex = val;
    notifyListeners();
  }

  RequestInfoController() {
    fetchProfileRequests();
  }

  List filteredList = [];
  List<Map<String, dynamic>> requests = [];

  filterList() {
    filteredList = [];
    filteredList = requests
        .where((element) =>
            element['request_status'] == options[selectedOptionIndex])
        .toList();
    notifyListeners();
  }

  Future<void> fetchProfileRequests() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('infoRequests')
              .where('user_uid',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where('request_status', isEqualTo: "pending")
              .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc
          in querySnapshot.docs) {
        requests.add(doc.data());
      }
    } catch (e) {
      requests = [];
    }
    filterList();
    notifyListeners();
  }

  final currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  final db = FirebaseFirestore.instance.collection(infoRequestCollection);
  requestProfileInfo({uid, img, name, age, education, maristat, loc}) {
    db.add(
      {
        'user_uid': currentUserUid,
        'requested_profile': uid,
        'img': img,
        'name': name,
        'age': age,
        'education': education,
        'location': loc,
        'marital_status': maristat,
        'request_status': 'pending',
        'request_date': getDateTimeInString(),
      },
    );
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchDocument(
    String requestedProfile,
  ) async {
    try {
      final collectionRef =
          FirebaseFirestore.instance.collection('infoRequests');
      final query = collectionRef
          .where('user_uid', isEqualTo: currentUserUid)
          .where('requested_profile', isEqualTo: requestedProfile);

      final snapshot = await query.get();

      if (snapshot.docs.isEmpty) {
        throw Exception('No document found matching the criteria.');
      }

      return snapshot.docs[0];
    } catch (error) {
      // Handle errors gracefully, e.g., logging, providing user feedback
      rethrow; // Or: return null or any other appropriate value
    }
  }

// Assuming you have initialized Firebase and Cloud Firestore

  Future<String?> fetchRequestStatus({requestedProfile}) async {
    try {
      final documentSnapshot = await fetchDocument(requestedProfile);
      return documentSnapshot.data()?['request_status'];
    } catch (error) {
      // Handle errors gracefully, e.g., logging, providing user feedback
      return null;
    }
  }
}
