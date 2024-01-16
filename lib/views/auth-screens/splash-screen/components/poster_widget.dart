import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';

Column posterWidget({img, title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(img, width: 75, height: 75),
      10.heightBox,
      "$title".text.size(16).white.fontFamily(marathiBold).make()
    ],
  );
}
