import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/services/firestore_services.dart';

class SearchProfilesController extends ChangeNotifier {
  List<DocumentSnapshot> searchResults = [];

  String error = "";

  void searchProfiles(String query) async {
    String searchString = query.trim();
    if (searchString.isNotEmpty) {
      List<DocumentSnapshot> results =
          await FirestoreServices.searchUsers(searchString);
      searchResults = results;
      if (results.isEmpty) error = "No Profiles Found";
      notifyListeners();
    }
  }
}
