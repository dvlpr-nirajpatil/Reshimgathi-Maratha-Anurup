import 'package:reshimgathi/consts/consts.dart';

SingleChildScrollView professionalInformation() {
  return SingleChildScrollView(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Professional Information".text.size(24).semiBold.make(),
          35.heightBox,
          customTextFormField(label: "Education", hint: "B.E. Computer"),
          10.heightBox,
          customTextFormField(label: "Occupation", hint: "IT Engineer"),
          10.heightBox,
          customTextFormField(label: "Company Name", hint: "Probity"),
          10.heightBox,
          customTextFormField(label: "Job Location", hint: "Mumbai"),
          10.heightBox,
          customTextFormField(label: "Sallary", hint: "50000"),
        ],
      ),
    ),
  );
}
