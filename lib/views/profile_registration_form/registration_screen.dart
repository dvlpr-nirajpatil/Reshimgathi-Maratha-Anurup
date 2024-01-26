import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/professional_info_registration_screen.dart';

class RegistrationScreen extends StatelessWidget {
  // personal information

  RegistrationScreen({super.key});

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
              "Personal Information".text.fontFamily(semiBold).size(18).make(),
              customTextFormField(
                  controller: controller.model.firstNameController,
                  label: "First Name",
                  hint: "Enter your first name"),
              customTextFormField(
                  controller: controller.model.lastNameController,
                  label: "Last Name",
                  hint: "Enter your last name"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: "Select Gender".text.fontFamily(semiBold).make(),
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                    hint: "Select your gender",
                    selectedValue: controller.model.selectedGender,
                    list: genders,
                    onchange: (value) {
                      controller.updateSelectedGender = value;
                    },
                  );
                },
              ),
              customTextFormField(
                  controller: controller.model.birthNameController,
                  label: "Birth Name",
                  hint: "Enter your Birth Name"),
              customTextFormField(
                  controller: controller.model.birthDateController,
                  label: "Birth Date",
                  hint: "Select Your Birthdate",
                  onlyread: true,
                  ontap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1970),
                      lastDate: DateTime.now(),
                    );

                    controller.model.birthDateController.text =
                        "${pickedDate!.day.padLeft(2, '0')}-${pickedDate.month.padLeft(2, '0')}-${pickedDate.year}";
                  }),
              customTextFormField(
                  controller: controller.model.birthTimeController,
                  label: "Birth Time",
                  hint: "Select Your Birthtime",
                  onlyread: true,
                  ontap: () async {
                    TimeOfDay? pickTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.input,
                    );
                    controller.model.birthTimeController.text = pickTime!.hour >
                            12
                        ? "${(pickTime.hour - 12).padLeft(2, '0')} : ${pickTime.minute.padLeft(2, '0')} PM"
                        : "${pickTime.hour.padLeft(2, '0')} : ${pickTime.minute.padLeft(2, '0')} AM";
                  }),
              customTextFormField(
                controller: controller.model.birthPlaceController,
                label: "Birth Place",
                hint: "Enter your birth Place",
              ),
              20.heightBox,
              "Ras".text.fontFamily(semiBold).make(),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      hint: "Select your Ras",
                      selectedValue: controller.model.selectedRas,
                      onchange: (value) {
                        controller.updateRas = value;
                      },
                      list: rasList);
                },
              ),
              10.heightBox,
              heightPicker(
                context,
                feetController: controller.model.heightInFeetController,
                inchController: controller.model.heightInInchesController,
              ),
              20.heightBox,
              "Blood Group".text.fontFamily(semiBold).make(),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      hint: "Select your blood group",
                      selectedValue: controller.model.selectedBloodGrp,
                      onchange: (value) {
                        controller.updateBloodGrp = value;
                      },
                      list: bloodGroup);
                },
              ),
              20.heightBox,
              "Caste".text.fontFamily(semiBold).make(),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      hint: "Select your caste",
                      selectedValue: controller.model.selectedCaste,
                      onchange: (value) {
                        controller.model.selectedCaste = value;
                      },
                      list: casts);
                },
              ),
              20.heightBox,
              "Marital Status".text.fontFamily(semiBold).make(),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      hint: "Select your marital status",
                      selectedValue: controller.model.selectedMaritalStatus,
                      onchange: (value) {
                        controller.updateMaterialStatus = value;
                      },
                      list: MaritalStatus);
                },
              ),
              20.heightBox,
              "Physical Disabilities".text.fontFamily(semiBold).make(),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      selectedValue:
                          controller.model.selectedPhysicalDisabilities,
                      onchange: (value) {
                        controller.updatePhysicalDisabilities = value;
                      },
                      list: yesNo);
                },
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return controller.model.selectedPhysicalDisabilities == 'Yes'
                      ? customTextFormField(
                          controller:
                              controller.model.physicalDisabilityController,
                          label: "Specify Disabilitiy",
                          hint: "Please specify your Disability",
                        )
                      : const SizedBox();
                },
              ),
              Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                return FilledButton(
                  onPressed: () async {
                    await controller.storePersonalDetails();

                    Get.to(
                      () => ProfessionalInfoScreen(),
                    );
                  },
                  child: controller.is_loading
                      ? SizedBox(
                          width: 10,
                          height: 10,
                          child: const CircularProgressIndicator(
                              color: Colors.white),
                        )
                      : "Continue".text.fontFamily(semiBold).make(),
                ).marginSymmetric(vertical: 30);
              })
            ],
          ),
        ),
      ),
    );
  }
}
