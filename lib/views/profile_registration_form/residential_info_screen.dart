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
                  controller:
                      controller.model.addressLine1ResidentialController,
                  label: "Address-1",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.model.areaResidentialController,
                  label: "Area",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.model.landmarkResidentialController,
                  label: "Landmark",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.model.cityResidentialController,
                  label: "City",
                ),
                customTextFormField(
                  required: true,
                  controller: controller.model.stateResidentialController,
                  label: "State",
                ),
                customTextFormField(
                  required: true,
                  textInput: TextInputType.number,
                  controller: controller.model.pincodeResidentialController,
                  label: "Pincode",
                ),
                Consumer<ProfileRegistrationController>(
                    builder: (context, provider, xx) {
                  return FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.updateRegistrationStatus(4);
                              Get.off(() => ContactInfoScreen());
                            }
                          },
                          child: controller.is_loading
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
