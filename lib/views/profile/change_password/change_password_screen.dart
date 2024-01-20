import 'dart:math';

import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: "Change Password".text.fontFamily(semiBold).size(18).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.heightBox,
            "Old Password".text.make(),
            10.heightBox,
            TextField(
              decoration: InputDecoration(border: InputBorder.none),
            ).box.border(color: borderColor).roundedSM.make(),
            25.heightBox,
            "New Password".text.make(),
            10.heightBox,
            TextField(
              decoration: InputDecoration(border: InputBorder.none),
            ).box.border(color: borderColor).roundedSM.make(),
            25.heightBox,
            "Confirm Password".text.make(),
            10.heightBox,
            TextField(
              decoration: InputDecoration(border: InputBorder.none),
            ).box.border(color: borderColor).roundedSM.make(),
            Spacer(),
            FilledButton(
              style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  backgroundColor: pinkColor),
              onPressed: () {},
              child:
                  "Change Password".text.size(16).fontFamily(semiBold).make(),
            ),
            60.heightBox,
          ],
        ),
      ),
    );
  }
}
