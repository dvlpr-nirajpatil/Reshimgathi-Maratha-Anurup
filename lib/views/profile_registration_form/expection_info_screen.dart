import 'package:flutter/material.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/upload_photos_screen.dart';

class ExpectionScreen extends StatelessWidget {
  const ExpectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: screenPadding.copyWith(),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            20.heightBox,
            "Expections".text.fontFamily(semiBold).size(18).make(),
            15.heightBox,
            heightPicker(context, prefix: "Preffered "),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                "Maximum Age Difference".text.fontFamily(semiBold).make(),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    onChanged: (val) {},
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ).paddingOnly(top: 5),
            customTextFormField(
                label: "Expected Education",
                hint: "Enter education seperated by ,"),
            customTextFormField(
                label: "Preffered Occupation",
                hint: "Engineer, Doctor, Business Man"),
            customTextFormField(
              label: "Preffered Location",
              hint: "Mumbai, Pune, Banglore",
            ),
            20.heightBox,
            "Marital Status".text.fontFamily(semiBold).make(),
            10.heightBox,
            Consumer<ProfileRegistrationController>(
              builder: (context, controller, xxx) {
                return customDropDownButton(
                    hint: "Select Marital Status",
                    selectedValue: controller.selectedMaritalStatus,
                    onchange: (value) {
                      controller.updateMaterialStatus = value;
                    },
                    list: MaritalStatus);
              },
            ),
            20.heightBox,
            "Mangal Accepted".text.fontFamily(semiBold).make(),
            10.heightBox,
            Consumer<ProfileRegistrationController>(
              builder: (context, controller, xxx) {
                return customDropDownButton(
                    selectedValue: controller.selectedPhysicalDisabilities,
                    onchange: (value) {
                      controller.updatePhysicalDisabilities = value;
                    },
                    list: yesNo);
              },
            ),
            20.heightBox,
            "Handicaped Accepted".text.fontFamily(semiBold).make(),
            10.heightBox,
            Consumer<ProfileRegistrationController>(
              builder: (context, controller, xxx) {
                return customDropDownButton(
                    selectedValue: controller.selectedPhysicalDisabilities,
                    onchange: (value) {
                      controller.updatePhysicalDisabilities = value;
                    },
                    list: yesNo);
              },
            ),
            FilledButton(
                    onPressed: () {
                      Get.to(() => UploadPhotosScreen());
                    },
                    child: "Continue".text.fontFamily(semiBold).make())
                .marginSymmetric(vertical: 40),
          ],
        )),
      ),
    );
  }
}
