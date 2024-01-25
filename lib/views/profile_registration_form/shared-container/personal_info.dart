import 'package:reshimgathi/consts/consts.dart';

Container personalInformation() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Personal Information".text.size(24).semiBold.make(),
        30.heightBox,
        customTextFormField(
          label: "Date of Birth \\ जन्म तारीख",
          hint: "(dd/mm/yyyy)",
        ),
        10.heightBox,
        customTextFormField(
          label: "Birth Time",
          hint: "10:00. pm",
        ),
        10.heightBox,
        customTextFormField(
          label: "Height",
          hint: "5'9 feet",
        ),
        10.heightBox,
        customTextFormField(
          label: "Blood Group",
          hint: "B+",
        ),
      ],
    ),
  );
}
