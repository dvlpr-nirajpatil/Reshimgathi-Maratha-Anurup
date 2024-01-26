import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/contact_info_screen.dart';

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
                controller: controller.model.addressLine1ResidentialController,
                label: "Address-1",
              ),
              customTextFormField(
                controller: controller.model.areaResidentialController,
                label: "Area",
              ),
              customTextFormField(
                controller: controller.model.landmarkResidentialController,
                label: "Landmark",
              ),
              customTextFormField(
                controller: controller.model.cityResidentialController,
                label: "City",
              ),
              customTextFormField(
                controller: controller.model.stateResidentialController,
                label: "State",
              ),
              customTextFormField(
                  controller: controller.model.pincodeResidentialController,
                  label: "Pincode",
                  textInput: TextInputType.number),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                  builder: (context, provider, xx) {
                return FilledButton(
                        onPressed: () async {
                          await controller.storeResidentialInformation();
                          Get.to(() => ContactInfoScreen());
                        },
                        child: controller.is_loading
                            ? Center(
                                child: SizedBox(
                                  height: 10,
                                  width: 10,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 5,
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
    );
  }
}
