import 'package:reshimgathi/consts/consts.dart';

Container customAuthScreenButton(BuildContext context, {title, ontap}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    width: context.screenWidth,
    child: ElevatedButton(
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(12)),

          // textStyle: MaterialStateProperty.all<Color>(),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          backgroundColor: MaterialStateProperty.all<Color>(pinkColor)),
      onPressed: () {
        ontap();
      },
      child: "$title".text.white.size(16).make(),
    ),
  );
}
