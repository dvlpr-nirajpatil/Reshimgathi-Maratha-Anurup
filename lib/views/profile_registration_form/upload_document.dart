import 'package:flutter_svg/svg.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/verification_waiting_screen.dart';
import 'dart:io';

import 'package:reshimgathi/views/shared-widget/custom_snackbar.dart';

class UploadDocumentScreen extends StatelessWidget {
  const UploadDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileRegistrationController>(context, listen: false);
    return Scaffold(
      body: Container(
        padding: screenPadding,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightBox,
              "Upload Document".text.fontFamily(semiBold).size(18).make(),
              30.heightBox,
              Column(
                children: [
                  Consumer<ProfileRegistrationController>(
                      builder: (context, controller, xxx) {
                    return controller.model.adharCard == null
                        ? Container(
                            color: faintPinkColor,
                            width: double.infinity,
                            height: context.height * 0.15,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    icUpload,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                  10.heightBox,
                                  "Upload Adhar Card".text.size(16).white.make()
                                ],
                              ),
                            ),
                          ).onTap(() {
                            controller.pickAdharCard();
                          })
                        : Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: context.height * 0.3,
                                child: Image.file(
                                  File(controller.model.adharCard!.path),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              10.heightBox,
                              Container(
                                width: context.width,
                                height: context.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: pinkColor,
                                ),
                                child: "Re-Upload Document"
                                    .text
                                    .white
                                    .make()
                                    .centered(),
                              ).onTap(() {
                                controller.pickAdharCard();
                              }),
                            ],
                          );
                  }),
                  customTextFormField(
                    label: "Adhar Card Number",
                    hint: "Enter adhar Number",
                  )
                ],
              )
                  .box
                  .border(color: borderColor)
                  .padding(EdgeInsets.all(12))
                  .roundedSM
                  .make(),
              30.heightBox,
              Column(
                children: [
                  Consumer<ProfileRegistrationController>(
                      builder: (context, controller, xxx) {
                    return controller.model.casteCertificate == null
                        ? Container(
                            color: faintPinkColor,
                            width: double.infinity,
                            height: context.height * 0.15,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    icUpload,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                  10.heightBox,
                                  "Upload Caste Certificate"
                                      .text
                                      .size(16)
                                      .white
                                      .make()
                                ],
                              ),
                            ),
                          ).onTap(() {
                            controller.pickCasteCertificate();
                          })
                        : Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: context.height * 0.3,
                                child: Image.file(
                                  File(controller.model.casteCertificate!.path),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              10.heightBox,
                              Container(
                                width: context.width,
                                height: context.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: pinkColor,
                                ),
                                child: "Re-Upload Document"
                                    .text
                                    .white
                                    .make()
                                    .centered(),
                              ).onTap(() {
                                controller.pickCasteCertificate();
                              }),
                            ],
                          );
                  }),
                  customTextFormField(
                    label: "Caste Certificate Number",
                    hint: "Certificate Number",
                  )
                ],
              )
                  .box
                  .border(color: borderColor)
                  .padding(EdgeInsets.all(12))
                  .roundedSM
                  .make(),
              20.heightBox,
              Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                return FilledButton(
                  onPressed: () async {
                    if (controller.model.casteCertificate == null) {
                      showSnackbar(
                          context, "Please upload your caste certificate");
                    } else {
                      await controller.storeDocuments();
                      Get.offAll(() => const VerificationPendingScreen());
                    }
                  },
                  child: controller.is_loading
                      ? SizedBox(
                          height: 10,
                          width: 10,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: whiteColor,
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : "Continue".text.fontFamily(semiBold).make(),
                );
              }),
              30.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
