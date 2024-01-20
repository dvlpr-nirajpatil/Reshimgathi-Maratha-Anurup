import 'package:reshimgathi/consts/consts.dart';

Container ContactInformation() {
  return Container(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Contact Information".text.size(24).semiBold.make(),
      20.heightBox,
      customTextfield(
        title: "Phone No 1",
        hint: "+91 8483728477",
        textInput: TextInputType.number,
      ),
      customTextfield(
        title: "Phone No 2",
        hint: "+91 8483728477",
        textInput: TextInputType.number,
      ),
      customTextfield(
        title: "Email",
        hint: "dev.adityaaher@gmail.com",
      ),
    ],
  ));
}
