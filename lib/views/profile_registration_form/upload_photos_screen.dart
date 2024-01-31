import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/shared-widget/pregress_hud.dart';

class UploadPhotosScreen extends StatelessWidget {
  const UploadPhotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProfileRegistrationController>(
          builder: (context, controller, xxx) {
        return progressHud(
            msg: "Uploading your photos\n please wait..",
            vsync: controller.isLoading,
            child: Container(
              padding: screenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back).onTap(() {
                        Get.back();
                      }),
                      15.widthBox,
                      "Upload Photos".text.fontFamily(semiBold).size(18).make(),
                    ],
                  ),
                  60.heightBox,
                  controller.images.images!.length == 0
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
                                  "Upload your images"
                                      .text
                                      .size(16)
                                      .white
                                      .make()
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
                          itemCount: controller.images.images!.length + 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return index <= 3
                                ? Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      index == controller.images.images!.length
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
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                            ).onTap(() {
                                              controller.pickImages();
                                            })
                                          : Container(
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Image.file(
                                                File(controller.images
                                                    .images![index].path),
                                                fit: BoxFit.cover,
                                              ),
                                              width: 100,
                                              height: 100,
                                            ),
                                      index == controller.images.images!.length
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
                                  )
                                : SizedBox();
                          }),
                  const Spacer(),
                  FilledButton(
                    onPressed: () async {
                      controller.loading = true;
                      if (controller.images.images?.length != 0) {
                        // controller.storeImages();
                        controller.updateRegistrationStatus(7);
                        controller.images.store();
                        Get.off(() => UploadDocumentScreen());
                      }

                      controller.loading = false;
                    },
                    child: controller.isLoading == true
                        ? SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                              color: whiteColor,
                              strokeWidth: 2,
                            ),
                          )
                        : "Continue".text.fontFamily(semiBold).make(),
                  ).marginSymmetric(vertical: 35)
                ],
              ),
            ));
      }),
    );
  }
}
