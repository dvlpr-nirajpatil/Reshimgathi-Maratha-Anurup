import 'package:reshimgathi/consts/consts.dart';

DottedBorder UplodImage(BuildContext context) {
  return DottedBorder(
    dashPattern: [5],
    strokeWidth: 1,
    child: Container(
      width: context.width,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          10.heightBox,
          Icon(
            Icons.file_upload_outlined,
            color: darkGrey,
            size: 70,
          ),
          15.heightBox,
          "Upload your images here".text.color(darkGrey).size(16).make()
        ],
      ),
    ),
  );
}
