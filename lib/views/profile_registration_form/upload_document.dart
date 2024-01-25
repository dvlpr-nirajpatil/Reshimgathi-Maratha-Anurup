import 'package:flutter_svg/svg.dart';
import 'package:reshimgathi/consts/consts.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.heightBox,
            "Upload Document".text.fontFamily(semiBold).size(18).make(),
            60.heightBox,
            Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
              return controller.documentImage == null
                  ? DottedBorder(
                      color: pinkColor,
                      child: Container(
                        color: faintPinkColor,
                        width: double.infinity,
                        height: context.height * 0.3,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                icUpload,
                                width: 70,
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
                        controller.pickDocument();
                      }))
                  : Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: context.height * 0.3,
                          child: Image.file(
                            File(controller.documentImage.path),
                            fit: BoxFit.contain,
                          ),
                        ),
                        30.heightBox,
                        Container(
                          width: context.width,
                          height: context.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: pinkColor,
                          ),
                          child:
                              "Re-Upload Document".text.white.make().centered(),
                        ).onTap(() {
                          controller.pickDocument();
                        }),
                      ],
                    );
            }),
            10.heightBox,
            customTextFormField(
              label: "Cast Certificate Serial Number",
              hint: "Enter Serial Number",
            ),
            Spacer(),
            FilledButton(
              onPressed: () {
                if (controller.documentImage == null) {
                  showSnackbar(context, "Please upload your caste certificate");
                } else {
                  showSnackbar(context, "Document upload Successfull");
                }
              },
              child: "Continue".text.fontFamily(semiBold).make(),
            ).marginSymmetric(vertical: 35)
          ],
        ),
      ),
    );
  }
}
