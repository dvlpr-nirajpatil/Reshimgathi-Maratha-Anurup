import 'package:flutter/material.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/expection_info_screen.dart';

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
              controller: controller.model.fatherContactNoController,
              label: "Father's Contact No.",
            ),
            customTextFormField(
              controller: controller.model.motherContactNoController,
              label: "Mother's Contact No",
            ),
            customTextFormField(
              controller: controller.model.whatsappNumberController,
              label: "WhatsApp No.",
            ),
            customTextFormField(
              controller: controller.model.emailAddressController,
              label: "Email",
            ),
            10.heightBox,
            Spacer(),
            Consumer<ProfileRegistrationController>(
                builder: (context, controller, xx) {
              return FilledButton(
                      onPressed: () async {
                        await controller.storeContactInformation();
                        Get.to(() => ExpectionScreen());
                      },
                      child: controller.is_loading
                          ? Center(
                              child: SizedBox(
                                height: 10,
                                width: 10,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : "Continue".text.fontFamily(semiBold).make())
                  .marginSymmetric(vertical: 40);
            }),
          ],
        ),
      ),
    );
  }
}
