import 'package:reshimgathi/consts/consts.dart';

Column UploadDocument(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Upload Document".text.size(24).semiBold.make(),
      20.heightBox,
      "Caste Certificate".text.size(18).make(),
      10.heightBox,
      DottedBorder(
        dashPattern: [5],
        strokeWidth: 1,
        child: Container(
          width: context.width,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              10.heightBox,
              Icon(
                Icons.file_upload_outlined,
                color: darkGrey,
                size: 60,
              ),
              15.heightBox,
              "Upload Document images here".text.color(darkGrey).size(16).make()
            ],
          ),
        ),
      ),
      20.heightBox,
      customTextfield(
          title: "Certificate Serial Number", hint: "Enter serial number ")
    ],
  );
}
