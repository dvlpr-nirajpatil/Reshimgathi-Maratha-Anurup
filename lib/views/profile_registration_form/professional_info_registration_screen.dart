import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/family_info_screen.dart';

class ProfessionalInfoScreen extends StatelessWidget {
  const ProfessionalInfoScreen({super.key});

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
            "Professional Information"
                .text
                .fontFamily(semiBold)
                .size(18)
                .make(),
            customTextFormField(
                controller: controller.model.educationController,
                label: "Education",
                hint: "B.E IT , B. Pharm , B.H.M.S"),
            customTextFormField(
                controller: controller.model.occupationController,
                label: "Occupation",
                hint: "Engineer, Doctor, Business Man"),
            customTextFormField(
              controller: controller.model.companyController,
              label: "Company or Business Name ",
              hint: "TCS, Inofsys",
            ),
            customTextFormField(
              controller: controller.model.joblocationController,
              label: "Job Location",
              hint: "Mumbai, Pune, Banglore",
            ),
            customTextFormField(
              controller: controller.model.annualincomeController,
              label: "Annual Income",
              hint: "5 LPA, 6 LPA",
            ),
            Spacer(),
            Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
              return FilledButton(
                      onPressed: () async {
                        await controller.storeProfessionalDetails();
                        Get.to(() => FamilyInfoScreen());
                      },
                      child: controller.is_loading
                          ? SizedBox(
                              width: 10,
                              height: 10,
                              child: const CircularProgressIndicator(
                                  color: Colors.white),
                            )
                          : "Continue".text.fontFamily(semiBold).make())
                  .marginSymmetric(vertical: 40);
            })
          ],
        ),
      ),
    );
  }
}
