import 'package:reshimgathi/consts/consts.dart';

Column genderCheck() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "I Am ".text.size(24).semiBold.make(),
      20.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: lightPinkColor,
            ),
          ),
          20.widthBox,
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: lightPinkColor,
            ),
          ),
        ],
      )
    ],
  );
}
