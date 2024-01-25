import 'package:flutter/material.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/expection_info_screen.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileRegistrationController>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: screenPadding.copyWith(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            20.heightBox,
            "Contact Information".text.fontFamily(semiBold).size(18).make(),
            customTextFormField(
              label: "Father's Contact No.",
            ),
            customTextFormField(
              label: "Mother's Contact No",
            ),
            customTextFormField(
              label: "WhatsApp No.",
            ),
            customTextFormField(
              label: "Email",
            ),
            10.heightBox,
            Spacer(),
            FilledButton(
                    onPressed: () {
                      Get.to(() => ExpectionScreen());
                    },
                    child: "Continue".text.fontFamily(semiBold).make())
                .marginSymmetric(vertical: 40),
          ],
        ),
      ),
    );
  }
}
