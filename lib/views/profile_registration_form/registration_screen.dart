import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/residential_info_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Get.offAll(() => SignInScreen());
          }),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Consumer<ProfileRegistrationController>(
            builder: (context, controller, x) {
          return Column(
            children: [
              optionsWidget(
                  title: "Personal Information",
                  is_completed:
                      controller.registrationStatus.rPersonal ?? false,
                  onTap: () {
                    Get.to(() => PersonalInformationScreen());
                  }),
              optionsWidget(
                  title: "Professional Information",
                  is_completed:
                      controller.registrationStatus.rProfessional ?? false,
                  onTap: () {
                    Get.to(() => ProfessionalInfoScreen());
                  }),
              optionsWidget(
                  title: "Family Background",
                  is_completed: controller.registrationStatus.rFamily ?? false,
                  onTap: () {
                    Get.to(() => FamilyInfoScreen());
                  }),
              optionsWidget(
                  title: "Residential Information",
                  is_completed:
                      controller.registrationStatus.rResidential ?? false,
                  onTap: () {
                    Get.to(() => ResidentialInfoScreen());
                  }),
              optionsWidget(
                  title: "Contact Details",
                  is_completed: controller.registrationStatus.rContact ?? false,
                  onTap: () {
                    Get.to(() => ContactInfoScreen());
                  }),
              optionsWidget(
                  title: "Expectations",
                  is_completed:
                      controller.registrationStatus.rExpectations ?? false,
                  onTap: () {
                    Get.to(() => ExpectionScreen());
                  }),
              optionsWidget(
                  title: "Upload Photos",
                  is_completed: controller.registrationStatus.rPhotos ?? false,
                  onTap: () {
                    Get.to(() => UploadPhotosScreen());
                  }),
              optionsWidget(
                  title: "Upload Documents",
                  is_completed:
                      controller.registrationStatus.rDocuments ?? false,
                  onTap: () {
                    Get.to(() => UploadDocumentScreen());
                  }),
              Spacer(),
              FilledButton(
                      onPressed: () {},
                      child: "Submit".text.fontFamily(semiBold).size(16).make())
                  .paddingSymmetric(vertical: 20)
            ],
          );
        }),
      ),
    );
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
