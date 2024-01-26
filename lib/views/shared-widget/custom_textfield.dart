import 'package:reshimgathi/consts/consts.dart';

customTextFormField(
    {label,
    ontap,
    hint,
    ispass = false,
    textInput = TextInputType.text,
    validator,
    controller,
    onlyread = false,
    onchange}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "$label".text.fontFamily(semiBold).make(),
      10.heightBox,
      TextFormField(
        onChanged: onchange,
        readOnly: onlyread,
        onTap: ontap,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        controller: controller,
        validator: validator,
        keyboardType: textInput,
        obscureText: ispass,
      ),
    ],
  ).marginOnly(top: 20);
}
