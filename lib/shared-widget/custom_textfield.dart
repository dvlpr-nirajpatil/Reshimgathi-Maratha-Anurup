import 'package:reshimgathi/consts/consts.dart';

Column customTextfield(
    {title, hint, ispass = false, textInput = TextInputType.text}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "$title".text.size(18).make(),
      10.heightBox,
      TextField(
        keyboardType: textInput,
        // controller: controller,
        obscureText: ispass,
        decoration: InputDecoration(
            hintText: "$hint",
            hintStyle: TextStyle(fontSize: 16, color: darkGrey),
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      ),
      15.heightBox,
    ],
  );
}
