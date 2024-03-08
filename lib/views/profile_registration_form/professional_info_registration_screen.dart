import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';

class ProfessionalInfoScreen extends StatelessWidget {
  ProfessionalInfoScreen({super.key});

  static const String id = "ProfessionalInfoScreen";

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
                      GoRouter.of(context).pop();
                    }),
                    15.widthBox,
                    "Professional Information"
                        .text
                        .fontFamily(semiBold)
                        .size(18)
                        .make(),
                  ],
                ),
                20.heightBox,
                customTextFormField(
                    required: true,
                    controller: controller.professionalDetails.education,
                    label: "Education",
                    hint: "B.E IT , B. Pharm , B.H.M.S"),
                customTextFormField(
                    required: true,
                    controller: controller.professionalDetails.occupation,
                    label: "Occupation",
                    hint: "Engineer, Doctor, Business Man"),
                customTextFormField(
                  required: true,
                  controller: controller.professionalDetails.company,
                  label: "Company or Business Name ",
                  hint: "TCS, Inofsys",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.professionalDetails.joblocation,
                  label: "Job Location",
                  hint: "Mumbai, Pune, Banglore",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.professionalDetails.annualincome,
                  label: "Annual Income",
                  hint: "5 LPA, 6 LPA",
                ),
                SizedBox(
                  height: context.height * 0.07,
                ),
                Consumer<ProfileRegistrationController>(
                    builder: (context, controller, xxx) {
                  return FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.updateRegistrationStatus(2);
                              controller.professionalDetails.store();

                              GoRouter.of(context)
                                  .pushReplacementNamed(FamilyInfoScreen.id);
                            }
                          },
                          child: controller.isLoading
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
