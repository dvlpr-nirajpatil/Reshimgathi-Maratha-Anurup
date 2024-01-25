import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/upload_document.dart';
import 'package:reshimgathi/views/shared-widget/custom_snackbar.dart';

class UploadPhotosScreen extends StatelessWidget {
  const UploadPhotosScreen({super.key});

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
            "Upload Images".text.fontFamily(semiBold).size(18).make(),
            60.heightBox,
            Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
              return controller.uploadImages!.length == 0
                  ? DottedBorder(
                      color: pinkColor,
                      child: Container(
                        color: faintPinkColor,
                        width: double.infinity,
                        height: context.height * 0.5,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                icUpload,
                                width: 100,
                                color: Colors.white,
                              ),
                              10.heightBox,
                              "Upload your images".text.size(16).white.make()
                            ],
                          ),
                        ),
                      ).onTap(() {
                        controller.pickImages();
                      }),
                    )
                  : GridView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: controller.uploadImages!.length + 1,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            index == controller.uploadImages!.length
                                ? Container(
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: whiteColor,
                                      ),
                                    ),
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: faintPinkColor,
                                        borderRadius: BorderRadius.circular(6)),
                                  )
                                : Container(
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Image.file(
                                      File(
                                          controller.uploadImages![index].path),
                                      fit: BoxFit.cover,
                                    ),
                                    width: 100,
                                    height: 100,
                                  ),
                            index == controller.uploadImages!.length
                                ? SizedBox()
                                : Positioned(
                                    top: -5,
                                    right: -5,
                                    child: CircleAvatar(
                                      radius: 15,
                                      backgroundColor: pinkColor,
                                      child: Icon(
                                        Icons.close,
                                        color: whiteColor,
                                      ),
                                    ).onTap(() {
                                      controller.removeImage(index);
                                    }),
                                  )
                          ],
                        );
                      });
            }),
            Spacer(),
            FilledButton(
              onPressed: () {
                if (controller.uploadImages?.length == 0) {
                  showSnackbar(context, "Please upload your Photos");
                } else {
                  Get.to(() => UploadDocumentScreen());
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
