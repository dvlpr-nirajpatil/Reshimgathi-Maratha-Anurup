import 'package:reshimgathi/consts/consts.dart';

Column genderCheck() {
  return Column(
    children: [
      "I Am ".text.size(24).semiBold.make(),
      50.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: pinkColor,
            ),
          ),
          20.widthBox,
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: pinkColor,
            ),
          ),
        ],
      )
    ],
  );
}
