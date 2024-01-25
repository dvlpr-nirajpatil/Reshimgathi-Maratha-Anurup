import 'package:reshimgathi/consts/consts.dart';

class ProfileScreenController extends ChangeNotifier {
  int imageIndex = 0;

  set setImageIndex(int x) {
    imageIndex = x;
    notifyListeners();
  }
}
