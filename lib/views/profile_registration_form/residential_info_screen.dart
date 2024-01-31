import 'package:reshimgathi/consts/consts.dart';

class ResidentialInfoScreen extends StatelessWidget {
  ResidentialInfoScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileRegistrationController>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: screenPadding.copyWith(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Icon(Icons.arrow_back).onTap(() {
                      Get.back();
                    }),
                    15.widthBox,
                    "Residential Information"
                        .text
                        .fontFamily(semiBold)
                        .size(18)
                        .make(),
                  ],
                ),
                20.heightBox,
                customTextFormField(
                  required: true,
                  controller: controller.residentialDetails.address,
                  label: "Address-1",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.residentialDetails.area,
                  label: "Area",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.residentialDetails.landmark,
                  label: "Landmark",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.residentialDetails.city,
                  label: "City",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.residentialDetails.state,
                  label: "State",
                ),
                customTextFormField(
                  required: true,
                  textInput: TextInputType.number,
                  controller: controller.residentialDetails.pincode,
                  label: "Pincode",
                ),
                Consumer<ProfileRegistrationController>(
                    builder: (context, provider, xx) {
                  return FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.updateRegistrationStatus(4);
                              controller.residentialDetails.store();
                              Get.off(() => ContactInfoScreen());
                            }
                          },
                          child: controller.isLoading
                              ? Center(
                                  child: SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                )
                              : "Continue".text.fontFamily(semiBold).make())
                      .marginSymmetric(vertical: 40);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
