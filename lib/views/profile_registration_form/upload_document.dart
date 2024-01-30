import 'package:flutter_svg/svg.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'dart:io';

import 'package:reshimgathi/views/shared-widget/pregress_hud.dart';

class UploadDocumentScreen extends StatelessWidget {
  UploadDocumentScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileRegistrationController>(
          builder: (context, controller, xxx) {
        return progressHud(
          msg: "Uploading your documents\n please wait..",
          vsync: controller.is_loading,
          child: Container(
            padding: screenPadding,
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    30.heightBox,
                    Row(
                      children: [
                        Icon(Icons.arrow_back).onTap(() {
                          Get.back();
                        }),
                        15.widthBox,
                        "Upload Documents"
                            .text
                            .fontFamily(semiBold)
                            .size(18)
                            .make(),
                      ],
                    ),
                    30.heightBox,
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          controller.model.adharCard == null
                              ? Container(
                                  color: faintPinkColor,
                                  width: double.infinity,
                                  height: context.height * 0.15,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          icUpload,
                                          width: 40,
                                          color: Colors.white,
                                        ),
                                        10.heightBox,
                                        "Upload Adhar Card"
                                            .text
                                            .size(16)
                                            .white
                                            .make()
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
                                ),
                          customTextFormField(
                            textInput: TextInputType.number,
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
                    ),
                    30.heightBox,
                    Column(
                      children: [
                        controller.model.casteCertificate == null
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
                                      "Upload Leaving Certificate"
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
                                      File(controller
                                          .model.casteCertificate!.path),
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
                              ),
                      ],
                    )
                        .box
                        .border(color: borderColor)
                        .padding(EdgeInsets.all(12))
                        .roundedSM
                        .make(),
                    FilledButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (controller.model.casteCertificate == null) {
                            showSnackbar(context,
                                "Please upload your caste certificate");
                          } else {
                            // await controller.storeDocuments();
                            controller.updateRegistrationStatus(8);
                            Get.back();
                          }
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
                    ).paddingSymmetric(vertical: 40),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
