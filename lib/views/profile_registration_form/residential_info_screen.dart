import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/contact_info_screen.dart';

class ResidentialInfoScreen extends StatelessWidget {
  const ResidentialInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileRegistrationController>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: screenPadding.copyWith(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              20.heightBox,
              "Residential Information"
                  .text
                  .fontFamily(semiBold)
                  .size(18)
                  .make(),
              customTextFormField(
                label: "Address-1",
              ),
              customTextFormField(
                label: "Area",
              ),
              customTextFormField(
                label: "Landmark",
              ),
              customTextFormField(
                label: "City",
              ),
              customTextFormField(
                label: "State",
              ),
              customTextFormField(
                  label: "Pincode", textInput: TextInputType.number),
              10.heightBox,
              FilledButton(
                      onPressed: () {
                        Get.to(() => ContactInfoScreen());
                      },
                      child: "Continue".text.fontFamily(semiBold).make())
                  .marginSymmetric(vertical: 40),
            ],
          ),
        ),
      ),
    );
  }
}
