import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/shared-container/gender-1.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/shared-container/upload-document.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/shared-container/uplod-image.dart';

class ProfileCreationScreen extends StatelessWidget {
  const ProfileCreationScreen({super.key});
  static String id = "ProfileCreationScreen";

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileFormController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Obx(
        () => Container(
          padding:
              screenPadding.copyWith(top: (80 * 100) / context.screenHeight),
          child: controller.ScreenNo == 0
              ? genderCheck()
              : controller.ScreenNo == 1
                  ? personalInformation()
                  : controller.ScreenNo == 2
                      ? professionalInformation()
                      : controller.ScreenNo == 3
                          ? familyBackground(controller)
                          : controller.ScreenNo == 4
                              ? ResidentialInformation()
                              : controller.ScreenNo == 5
                                  ? ContactInformation()
                                  : controller.ScreenNo == 6
                                      ? ExpectationsInformation()
                                      : controller.ScreenNo == 7
                                          ? UplodImage(context)
                                          : controller.ScreenNo == 8
                                              ? UploadDocument(context)
                                              : registrationSuccessScreen(
                                                  context),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Obx(
          () => controller.ScreenNo == 9
              ? SizedBox()
              : customAuthScreenButton(context, title: "continue", ontap: () {
                  controller.ScreenNo += 1;
                }),
        ),
      ),
    );
  }
}
