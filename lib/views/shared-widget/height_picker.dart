import 'package:flutter/services.dart';
import 'package:reshimgathi/consts/consts.dart';

Column heightPicker(BuildContext context,
    {feetController, inchController, prefix = ""}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      "${prefix}Height".text.fontFamily(semiBold).make(),
      10.heightBox,
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: TextFormField(
              cursorHeight: 14,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              keyboardType: TextInputType.number,
              controller: feetController,
            ),
          ),
          10.widthBox,
          "Feets".text.make(),
          20.widthBox,
          SizedBox(
            width: 50,
            height: 50,
            child: TextFormField(
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              cursorHeight: 14,
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
              onChanged: (value) {
                if (value.length == 2) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty) {
                  FocusScope.of(context).previousFocus();
                }
              },
              keyboardType: TextInputType.number,
              controller: inchController,
            ),
          ),
          10.widthBox,
          "Inches".text.make()
        ],
      ),
    ],
  );
}
