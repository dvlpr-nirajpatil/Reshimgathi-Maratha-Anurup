import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/family_info_screen.dart';

class ProfessionalInfoScreen extends StatelessWidget {
  const ProfessionalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                label: "Education", hint: "B.E IT , B. Pharm , B.H.M.S"),
            customTextFormField(
                label: "Occupation", hint: "Engineer, Doctor, Business Man"),
            customTextFormField(
              label: "Company or Business Name ",
              hint: "TCS, Inofsys",
            ),
            customTextFormField(
              label: "Job Location",
              hint: "Mumbai, Pune, Banglore",
            ),
            customTextFormField(
              label: "Annual Income",
              hint: "5 LPA, 6 LPA",
            ),
            Spacer(),
            FilledButton(
                    onPressed: () {
                      Get.to(() => FamilyInfoScreen());
                    },
                    child: "Continue".text.fontFamily(semiBold).make())
                .marginSymmetric(vertical: 40),
          ],
        ),
      ),
    );
  }
}
