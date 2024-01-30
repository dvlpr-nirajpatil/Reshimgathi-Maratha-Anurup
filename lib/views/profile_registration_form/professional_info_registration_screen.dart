import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/family_info_screen.dart';

class ProfessionalInfoScreen extends StatelessWidget {
  ProfessionalInfoScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileRegistrationController>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        padding: screenPadding.copyWith(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                20.heightBox,
                Row(
                  children: [
                    Icon(Icons.arrow_back).onTap(() {
                      Get.back();
                    }),
                    15.widthBox,
                    "Personal Information"
                        .text
                        .fontFamily(semiBold)
                        .size(18)
                        .make(),
                  ],
                ),
                20.heightBox,
                customTextFormField(
                    required: true,
                    controller: controller.model.educationController,
                    label: "Education",
                    hint: "B.E IT , B. Pharm , B.H.M.S"),
                customTextFormField(
                    required: true,
                    controller: controller.model.occupationController,
                    label: "Occupation",
                    hint: "Engineer, Doctor, Business Man"),
                customTextFormField(
                  required: true,
                  controller: controller.model.companyController,
                  label: "Company or Business Name ",
                  hint: "TCS, Inofsys",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.model.joblocationController,
                  label: "Job Location",
                  hint: "Mumbai, Pune, Banglore",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.model.annualincomeController,
                  label: "Annual Income",
                  hint: "5 LPA, 6 LPA",
                ),
                SizedBox(
                  height: context.height * 0.15,
                ),
                Consumer<ProfileRegistrationController>(
                    builder: (context, controller, xxx) {
                  return FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.updateRegistrationStatus(2);
                              Get.off(() => FamilyInfoScreen());
                            }
                          },
                          child: controller.is_loading
                              ? SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: const CircularProgressIndicator(
                                      strokeWidth: 2, color: Colors.white),
                                )
                              : "Continue".text.fontFamily(semiBold).make())
                      .marginSymmetric(vertical: 40);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
