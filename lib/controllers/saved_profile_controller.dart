import 'dart:async';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/services/save_profile.dart';

class SavedProfilesController extends ChangeNotifier {
  final CollectionReference _saveProfilesCollection =
      FirebaseFirestore.instance.collection(saveProfilesCollection);
  StreamSubscription<DocumentSnapshot>? _subscription;

  Map<String, dynamic> savedProfiles = {};

  SavedProfilesController() {
    listenToProfileChanges();
  }

  void listenToProfileChanges() {
    // Cancel the previous subscription if it exists
    _subscription?.cancel();

    // Get a reference to the document in the SaveProfiles collection
    DocumentReference documentReference =
        _saveProfilesCollection.doc(FirebaseAuth.instance.currentUser!.uid);

    // Subscribe to the document stream
    _subscription = documentReference.snapshots().listen(
      (DocumentSnapshot snapshot) {
        if (snapshot.exists) {
          // Get the data from the document
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

          // Update the savedProfiles variable
          savedProfiles.clear();
          if (data.containsKey('savedProfiles')) {
            savedProfiles = data['savedProfiles'];
            notifyListeners();
          }
          // You can do more processing or update UI here if needed
        } else {
          // Document does not exist
          // Handle the case where the document does not exist
        }
      },
      onError: (error) {
        print('Error listening to profile changes: $error');
      },
    );
  }

  void unsaveProfile({uid}) {
    SaveProfileService.unsaveProfile(uid: uid);
    savedProfiles.remove(uid);
    notifyListeners();
  }
}
