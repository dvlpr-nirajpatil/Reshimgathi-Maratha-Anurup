import 'package:reshimgathi/consts/consts.dart';

class ExpectionScreen extends StatelessWidget {
  ExpectionScreen({super.key});

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
                  "Expectations".text.fontFamily(semiBold).size(18).make(),
                ],
              ),
              20.heightBox,
              customTextFormField(
                  required: true,
                  controller: controller.model.expectedEducationController,
                  label: "Expected Education",
                  hint: "Enter education seperated by ,"),
              heightPicker(context,
                  inchController:
                      controller.model.prefferedHeightInInchesController,
                  feetController:
                      controller.model.prefferedHeightInFeetController),
              customTextFormField(
                  controller: controller.model.prefferedOccupationController,
                  label: "Preffered Occupation",
                  hint: "Engineer, Doctor, Business Man"),
              customTextFormField(
                controller: controller.model.prefferedLocationController,
                label: "Preffered Location",
                hint: "Mumbai, Pune, Banglore",
              ),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Maximum Age Difference".text.fontFamily(semiBold).make(),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller:
                          controller.model.prefferedMaxAgeDifferenceController,
                      onChanged: (val) {},
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ).paddingOnly(top: 5),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      label: "Marital Status",
                      hint: "Select Marital Status",
                      selectedValue:
                          controller.model.prefferedMaritalStatusSelector,
                      onchange: (value) {
                        controller.model.prefferedMaritalStatusSelector = value;
                      },
                      list: MaritalStatus);
                },
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      label: "Mangal Accepted",
                      hint: "Please select your preference",
                      selectedValue:
                          controller.model.prefferedMangalAcceptedSelector,
                      onchange: (value) {
                        controller.model.prefferedMangalAcceptedSelector =
                            value;
                      },
                      list: yesNo);
                },
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      label: "Handicap Accepted",
                      hint: "Please select your preference",
                      selectedValue:
                          controller.model.prefferedHandicapedSelector,
                      onchange: (value) {
                        controller.model.selectedPhysicalDisabilities = value;
                      },
                      list: yesNo);
                },
              ),
              Consumer<ProfileRegistrationController>(
                  builder: (context, controller, x) {
                return FilledButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await controller.updateRegistrationStatus(6);
                            Get.off(() => UploadPhotosScreen());
                          }
                        },
                        child: controller.is_loading
                            ? SizedBox(
                                width: 10,
                                height: 10,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: whiteColor,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : "Continue".text.fontFamily(semiBold).make())
                    .marginSymmetric(vertical: 40);
              }),
            ],
          ),
        )),
      ),
    );
  }
}
