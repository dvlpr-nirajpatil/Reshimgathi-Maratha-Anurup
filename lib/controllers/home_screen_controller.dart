import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/profile_details_model.dart';

class HomeScreenController extends ChangeNotifier {
  int _selectedScreenIndex = 0;

  set setScreenIndex(int x) {
    _selectedScreenIndex = x;
    notifyListeners();
  }

  void reset() {
    _selectedScreenIndex = 0;
    notifyListeners();
  }

  int get selectedScreenIndex => _selectedScreenIndex;

  List<ProfileDetails> Matches = [
    ProfileDetails(
      name: "Isha Gupta",
      age: 21,
      occupation: "BHMS",
      location: "Pune",
      imgUrl: igGirl,
    ),
    ProfileDetails(
      name: "Pooja Dikhit",
      age: 21,
      occupation: "B.E. Computer",
      location: "Mumbai",
      imgUrl: igGirl1,
    ),
    ProfileDetails(
      name: "Jasleen Royal",
      age: 21,
      occupation: "B.Pharm",
      location: "Dhule",
      imgUrl: igGirl2,
    ),
  ];

  List prefs = [
    ["Groom", true.obs],
    ["Bride", true.obs],
    ["Divorse", true.obs],
    ["Widow", true.obs],
  ];

  // filter options
  int min_age_value = 20;
  int max_age_value = 25;
}
