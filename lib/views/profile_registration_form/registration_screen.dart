import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/professional_info_registration_screen.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});
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
                20.heightBox,
                "Personal Information"
                    .text
                    .fontFamily(semiBold)
                    .size(22)
                    .make(),
                customTextFormField(
                    required: true,
                    controller: controller.model.firstNameController,
                    label: "First Name",
                    hint: "Enter your first name"),
                customTextFormField(
                    required: true,
                    controller: controller.model.lastNameController,
                    label: "Last Name",
                    hint: "Enter your last name"),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                      label: "Gender",
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
                    required: true,
                    controller: controller.model.birthNameController,
                    label: "Birth Name",
                    hint: "Enter your Birth Name"),
                customTextFormField(
                    required: true,
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
                    required: true,
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
                      controller.model.birthTimeController.text = pickTime!
                                  .hour >
                              12
                          ? "${(pickTime.hour - 12).padLeft(2, '0')} : ${pickTime.minute.padLeft(2, '0')} PM"
                          : "${pickTime.hour.padLeft(2, '0')} : ${pickTime.minute.padLeft(2, '0')} AM";
                    }),
                customTextFormField(
                  required: true,
                  controller: controller.model.birthPlaceController,
                  label: "Birth Place",
                  hint: "Enter your birth Place",
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Rashi",
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
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Blood Group",
                        hint: "Select your blood group",
                        selectedValue: controller.model.selectedBloodGrp,
                        onchange: (value) {
                          controller.updateBloodGrp = value;
                        },
                        list: bloodGroup);
                  },
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Caste",
                        hint: "Select your caste",
                        selectedValue: controller.model.selectedCaste,
                        onchange: (value) {
                          controller.model.selectedCaste = value;
                        },
                        list: casts);
                  },
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Marital Status",
                        hint: "Select your marital status",
                        selectedValue: controller.model.selectedMaritalStatus,
                        onchange: (value) {
                          controller.updateMaterialStatus = value;
                        },
                        list: MaritalStatus);
                  },
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Physical Disabilities",
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
                    return controller.model.selectedPhysicalDisabilities ==
                            'Yes'
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
                      if (_formKey.currentState!.validate()) {
                        await controller.storePersonalDetails();

                        Get.to(
                          () => ProfessionalInfoScreen(),
                        );
                      }
                    },
                    child: controller.is_loading
                        ? SizedBox(
                            width: 10,
                            height: 10,
                            child: const CircularProgressIndicator(
                                color: Colors.white),
                          )
                        : "Continue".text.fontFamily(semiBold).make(),
                  ).marginSymmetric(vertical: 40);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
