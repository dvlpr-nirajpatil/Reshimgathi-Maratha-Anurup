import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';

class PersonalInformationScreen extends StatelessWidget {
  static const String id = "PersonalInformation";
  PersonalInformationScreen({super.key});
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
                    const Icon(Icons.arrow_back).onTap(() {
                      GoRouter.of(context).pop();
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
                    controller: controller.personalDetails.firstName,
                    label: "First Name",
                    hint: "Enter your first name"),
                customTextFormField(
                    required: true,
                    controller: controller.personalDetails.lastName,
                    label: "Last Name",
                    hint: "Enter your last name"),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                      label: "Gender",
                      hint: "Select your gender",
                      selectedValue: controller.personalDetails.gender,
                      list: genders,
                      onchange: (value) {
                        controller.personalDetails.gender = value;
                      },
                    );
                  },
                ),
                customTextFormField(
                    required: true,
                    controller: controller.personalDetails.birthName,
                    label: "Birth Name",
                    hint: "Enter your Birth Name"),
                customTextFormField(
                    required: true,
                    controller: controller.personalDetails.birthDate,
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

                      controller.personalDetails.birthDate.text =
                          "${pickedDate!.day.padLeft(2, '0')}-${pickedDate.month.padLeft(2, '0')}-${pickedDate.year}";
                    }),
                customTextFormField(
                    required: true,
                    controller: controller.personalDetails.birthTime,
                    label: "Birth Time",
                    hint: "Select Your Birthtime",
                    onlyread: true,
                    ontap: () async {
                      TimeOfDay? pickTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                      controller.personalDetails.birthTime.text = pickTime!
                                  .hour >
                              12
                          ? "${(pickTime.hour - 12).padLeft(2, '0')} : ${pickTime.minute.padLeft(2, '0')} PM"
                          : "${pickTime.hour.padLeft(2, '0')} : ${pickTime.minute.padLeft(2, '0')} AM";
                    }),
                customTextFormField(
                  required: true,
                  controller: controller.personalDetails.birthPlace,
                  label: "Birth Place",
                  hint: "Enter your birth Place",
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Rashi",
                        hint: "Select your Rashi",
                        selectedValue: controller.personalDetails.ras,
                        onchange: (value) {
                          controller.personalDetails.ras = value;
                        },
                        list: rasList);
                  },
                ),
                10.heightBox,
                heightPicker(
                  context,
                  feetController: controller.personalDetails.heightInFeet,
                  inchController: controller.personalDetails.heightInInches,
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Blood Group",
                        hint: "Select your blood group",
                        selectedValue: controller.personalDetails.bloodGroup,
                        onchange: (value) {
                          controller.personalDetails.bloodGroup = value;
                        },
                        list: bloodGroup);
                  },
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Caste",
                        hint: "Select your caste",
                        selectedValue: controller.personalDetails.caste,
                        onchange: (value) {
                          controller.personalDetails.caste = value;
                        },
                        list: casts);
                  },
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Marital Status",
                        hint: "Select your marital status",
                        selectedValue: controller.personalDetails.maritalStatus,
                        onchange: (value) {
                          controller.personalDetails.maritalStatus = value;
                        },
                        list: MaritalStatus);
                  },
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return customDropDownButton(
                        label: "Physical Disabilities",
                        selectedValue:
                            controller.personalDetails.isPhysicallyDissabled,
                        onchange: (value) {
                          controller.updatePhysicalDisabilities = value;
                        },
                        list: yesNo);
                  },
                ),
                Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                    return controller.personalDetails.isPhysicallyDissabled ==
                            'Yes'
                        ? customTextFormField(
                            controller:
                                controller.personalDetails.physicalDisability,
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
                      //TODO Implememny Navigation
                      // if (_formKey.currentState!.validate()) {
                      //   await controller.updateRegistrationStatus(1);
                      //   controller.personalDetails.store();

                      // }
                      GoRouter.of(context)
                          .pushReplacementNamed(ProfessionalInfoScreen.id);
                    },
                    child: controller.isLoading
                        ? const SizedBox(
                            width: 10,
                            height: 10,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
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
