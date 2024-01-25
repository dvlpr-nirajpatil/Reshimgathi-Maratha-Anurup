import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/professional_info_registration_screen.dart';

class RegistrationScreen extends StatelessWidget {
  // personal information

  RegistrationScreen({super.key});

  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController birthtimeController = TextEditingController();
  final TextEditingController heightInFeetController = TextEditingController();
  final TextEditingController heightInInchesController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  label: "First Name", hint: "Enter your first name"),
              customTextFormField(
                  label: "Last Name", hint: "Enter your last name"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: "Select Gender".text.fontFamily(semiBold).make(),
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                    hint: "Select your gender",
                    selectedValue: controller.selectedGender,
                    list: genders,
                    onchange: (value) {
                      controller.updateSelectedGender = value;
                    },
                  );
                },
              ),
              customTextFormField(
                  controller: birthdateController,
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

                    birthdateController.text =
                        "${pickedDate!.day.padLeft(2, '0')}-${pickedDate.month.padLeft(2, '0')}-${pickedDate.year}";
                  }),
              customTextFormField(
                  controller: birthtimeController,
                  label: "Birth Time",
                  hint: "Select Your Birthtime",
                  onlyread: true,
                  ontap: () async {
                    TimeOfDay? pickTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.input,
                    );
                    birthtimeController.text = pickTime!.hour > 12
                        ? "${(pickTime.hour - 12).padLeft(2, '0')} : ${pickTime.minute.padLeft(2, '0')} PM"
                        : "${pickTime.hour.padLeft(2, '0')} : ${pickTime.minute.padLeft(2, '0')} AM";
                  }),
              customTextFormField(
                label: "Birth Place",
                hint: "Enter your birth Place",
              ),
              10.heightBox,
              heightPicker(context,
                  feetController: heightInFeetController,
                  inchController: heightInInchesController),
              20.heightBox,
              "Blood Group".text.fontFamily(semiBold).make(),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      hint: "Select your blood group",
                      selectedValue: controller.selectedBloodGrp,
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
                      selectedValue: controller.selectedCaste,
                      onchange: (value) {
                        controller.updateCaste = value;
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
                      selectedValue: controller.selectedMaritalStatus,
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
                      selectedValue: controller.selectedPhysicalDisabilities,
                      onchange: (value) {
                        controller.updatePhysicalDisabilities = value;
                      },
                      list: yesNo);
                },
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return controller.selectedPhysicalDisabilities == 'Yes'
                      ? customTextFormField(
                          label: "Specify Disabilitiy",
                          hint: "Please specify your Disability",
                        )
                      : const SizedBox();
                },
              ),
              FilledButton(
                onPressed: () {
                  Get.to(() => ProfessionalInfoScreen());
                },
                child: "Continue".text.fontFamily(semiBold).make(),
              ).marginSymmetric(vertical: 30)
            ],
          ),
        ),
      ),
    );
  }
}
