import 'dart:math';
import 'package:reshimgathi/consts/consts.dart';

class HomeScreenController extends ChangeNotifier {
  int _selectedScreenIndex = 0;
  int setSize = 4;

  String? filterParameter;

  bool isProfileLoading = false;
  bool moreProfileAvailable = true;

  List<String> filterationParameters = [
    "reg_id",
    "first_name",
    "last_name",
    "education"
  ];

  HomeScreenController() {
    Random random = Random();
    filterParameter =
        filterationParameters[random.nextInt(filterationParameters.length)];
    getProfiles();
  }

  bool isLoading = false;

  set loading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  set setScreenIndex(int x) {
    _selectedScreenIndex = x;
    notifyListeners();
  }

  void reset() {
    _selectedScreenIndex = 0;
    notifyListeners();
  }

  int get selectedScreenIndex => _selectedScreenIndex;

  List prefs = [
    ["Groom", true.obs],
    ["Bride", true.obs],
    ["Divorse", true.obs],
    ["Widow", true.obs],
  ];

  // filter options
  int minAgeValue = 20;
  int maxAgeValue = 25;

  List<DocumentSnapshot> profiles = [];
  late DocumentSnapshot lastProfile;

  getProfiles() async {
    isProfileLoading = true;
    Query q = database
        .collection(registerCollection)
        .orderBy(filterParameter!)
        .limit(setSize);
    loading = true;
    QuerySnapshot querySnapshot = await q.get();
    loading = false;
    profiles = querySnapshot.docs;
    lastProfile = querySnapshot.docs[querySnapshot.docs.length - 1];
    isProfileLoading = false;
    notifyListeners();
  }

  getMoreProfiles() async {
    if (moreProfileAvailable == false) {
      return;
    }

    if (isProfileLoading) {
      return;
    }

    isProfileLoading = true;
    var lastprofileData = lastProfile.data() as Map<String, dynamic>;
    Query q = database
        .collection(registerCollection)
        .orderBy(filterParameter!)
        .startAfter([lastprofileData[filterParameter!]]).limit(setSize);

    QuerySnapshot querySnapshot = await q.get();

    if (querySnapshot.docs.length < setSize) {
      moreProfileAvailable = false;
    }

    if (querySnapshot.docs.isNotEmpty) {
      lastProfile = querySnapshot.docs[querySnapshot.docs.length - 1];
    }

    profiles.addAll(querySnapshot.docs);
    isProfileLoading = false;
    notifyListeners();
  }
}
