import 'package:reshimgathi/consts/consts.dart';

Container ContactInformation() {
  return Container(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Contact Information".text.size(24).semiBold.make(),
      20.heightBox,
      customTextFormField(
        label: "Phone No 1",
        hint: "+91 8483728477",
        textInput: TextInputType.number,
      ),
      customTextFormField(
        label: "Phone No 2",
        hint: "+91 8483728477",
        textInput: TextInputType.number,
      ),
      customTextFormField(
        label: "Email",
        hint: "dev.adityaaher@gmail.com",
      ),
    ],
  ));
}
