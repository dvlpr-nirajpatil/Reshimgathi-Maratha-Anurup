import 'package:reshimgathi/consts/consts.dart';

SingleChildScrollView professionalInformation() {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Professional Information".text.size(24).semiBold.make(),
          35.heightBox,
          customTextfield(title: "Education", hint: "B.E. Computer"),
          10.heightBox,
          customTextfield(title: "Occupation", hint: "IT Engineer"),
          10.heightBox,
          customTextfield(title: "Company Name", hint: "Probity"),
          10.heightBox,
          customTextfield(title: "Job Location", hint: "Mumbai"),
          10.heightBox,
          customTextfield(title: "Sallary", hint: "50000"),
        ],
      ),
    ),
  );
}
