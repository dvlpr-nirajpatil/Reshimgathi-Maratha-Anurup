import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/residential_info_screen.dart';
import 'package:reshimgathi/views/shared-widget/pregress_hud.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});
  static const String id = "RegistrationScreen";
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileRegistrationController>(
        builder: (context, controller, xxx) {
      return progressHud(
        msg: "Registering your profile",
        vsync: controller.isLoading,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            centerTitle: false,
            title: "Create your profile"
                .text
                .fontFamily(semiBold)
                .size(24)
                .make()
                .paddingOnly(left: 20),
            actions: [
              Icon(
                Icons.logout_outlined,
                color: pinkColor,
              ).paddingOnly(right: 20).onTap(() async {
                await Provider.of<AuthController>(context, listen: false)
                    .userSignOut();
                GoRouter.of(context).goNamed(SignInScreen.id);
              }),
            ],
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Consumer<ProfileRegistrationController>(
                builder: (context, controller, x) {
              return Column(
                children: [
                  optionsWidget(
                      title: "Personal Information",
                      is_completed:
                          controller.registrationStatus.personal == "YES",
                      onTap: () {
                        GoRouter.of(context)
                            .goNamed(PersonalInformationScreen.id);
                      }),
                  optionsWidget(
                      title: "Professional Information",
                      is_completed:
                          controller.registrationStatus.professional == "YES",
                      onTap: () {
                        GoRouter.of(context).goNamed(ProfessionalInfoScreen.id);
                      }),
                  optionsWidget(
                      title: "Family Background",
                      is_completed:
                          controller.registrationStatus.family == "YES",
                      onTap: () {
                        GoRouter.of(context).goNamed(FamilyInfoScreen.id);
                      }),
                  optionsWidget(
                      title: "Residential Information",
                      is_completed:
                          controller.registrationStatus.residential == "YES",
                      onTap: () {
                        GoRouter.of(context).goNamed(ResidentialInfoScreen.id);
                      }),
                  optionsWidget(
                      title: "Contact Details",
                      is_completed:
                          controller.registrationStatus.contact == "YES",
                      onTap: () {
                        GoRouter.of(context).goNamed(ContactInfoScreen.id);
                      }),
                  optionsWidget(
                      title: "Expectations",
                      is_completed:
                          controller.registrationStatus.expectations == "YES",
                      onTap: () {
                        GoRouter.of(context).goNamed(ExpectionScreen.id);
                      }),
                  optionsWidget(
                      title: "Upload Photos",
                      is_completed:
                          controller.registrationStatus.photos == "YES",
                      onTap: () {
                        GoRouter.of(context).goNamed(UploadPhotosScreen.id);
                      }),
                  optionsWidget(
                      title: "Upload Documents",
                      is_completed:
                          controller.registrationStatus.documents == "YES",
                      onTap: () {
                        GoRouter.of(context).goNamed(UploadDocumentScreen.id);
                      }),
                  const Spacer(),
                  Consumer<ProfileRegistrationController>(
                      builder: (context, controller, xx) {
                    return FilledButton(
                            onPressed: controller.registrationStatus
                                    .checkProfileCompleted()
                                ? () async {
                                    await controller.submitUserDetails();
                                    Get.offAll(
                                        () => VerificationPendingScreen());
                                  }
                                : null,
                            child: controller.isLoading
                                ? const SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white),
                                    ),
                                  )
                                : "Submit"
                                    .text
                                    .fontFamily(semiBold)
                                    .size(16)
                                    .make())
                        .paddingSymmetric(vertical: 20);
                  })
                ],
              );
            }),
          ),
        ),
      );
    });
  }

  optionsWidget({title, is_completed = false, onTap}) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: is_completed ? greenColor : redColor,
          child: Center(
            child: is_completed
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.timer,
                    color: Colors.white,
                  ),
          ),
        ),
        15.widthBox,
        "$title".text.size(16).make(),
      ],
    )
        .box
        .border(color: borderColor)
        .roundedSM
        .padding(const EdgeInsets.all(10))
        .make()
        .marginOnly(top: 20)
        .onTap(() {
      onTap();
    });
  }
}
