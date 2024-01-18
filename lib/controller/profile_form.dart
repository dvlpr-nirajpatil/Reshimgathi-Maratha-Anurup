import 'package:get/get.dart';
import 'package:reshimgathi/consts/consts.dart';

class ProfileFormController extends GetxController {
  var ScreenNo = 0.obs;
  var selectOptionBrother = 0.obs;
  var selectOptionSister = 0.obs;
  var selectOptionMama = 0.obs;
  Rx<int> brotherCount = 0.obs;
  // TextEditingController brotherCount = TextEditingController();
  TextEditingController sisterCount = TextEditingController();
  TextEditingController mamaCount = TextEditingController();
}
