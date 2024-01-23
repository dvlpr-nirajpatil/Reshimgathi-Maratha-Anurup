import 'package:reshimgathi/consts/consts.dart';

customTextFormField(
    {label,
    hint,
    ispass = false,
    textInput = TextInputType.text,
    validator,
    controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "$label".text.size(18).make(),
      10.heightBox,
      TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: textInput,
        // controller: controller,
        obscureText: ispass,
      ),
    ],
  ).marginSymmetric(vertical: 5);
}
