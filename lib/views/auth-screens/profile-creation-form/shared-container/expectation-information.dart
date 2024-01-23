import 'package:reshimgathi/consts/consts.dart';

Column ExpectationsInformation() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "Expectations Information".text.size(24).semiBold.make(),
      20.heightBox,
      customTextFormField(label: "Education", hint: "BE Computer"),
      customTextFormField(
        label: "Max age difference",
        hint: "2 ",
        textInput: TextInputType.number,
      ),
      customTextFormField(
        label: "Preferred City",
        hint: "Pune ",
      ),
      customTextFormField(
        label: "Horoscope needed ?",
        hint: "Yes / No ",
      ),
    ],
  );
}
