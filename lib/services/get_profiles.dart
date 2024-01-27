import 'package:reshimgathi/consts/consts.dart';

class FetchProfiles {
  static getAllProfiles() async {
    return database.collection('userRegister').snapshots();
  }
}
