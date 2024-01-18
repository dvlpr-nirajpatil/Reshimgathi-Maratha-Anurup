import 'package:reshimgathi/consts/consts.dart';

Column ExpectationsInformation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Expectations Information".text.size(24).semiBold.make(),
      20.heightBox,
      customTextfield(title: "Education", hint: "BE Computer"),
      customTextfield(
        title: "Max age difference",
        hint: "2 ",
        textInput: TextInputType.number,
      ),
      customTextfield(
        title: "Preferred City",
        hint: "Pune ",
      ),
      customTextfield(
        title: "Horoscope needed ?",
        hint: "Yes / No ",
      ),
    ],
  );
}
