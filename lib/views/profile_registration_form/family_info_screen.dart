import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/residential_info_screen.dart';

class FamilyInfoScreen extends StatelessWidget {
  static const String id = "FamilyInfoScreen";
  FamilyInfoScreen({super.key});
  String getNumberSuffix(int number) {
    if (number >= 11 && number <= 13) {
      return 'th';
    } else {
      switch (number % 10) {
        case 1:
          return 'st';
        case 2:
          return 'nd';
        case 3:
          return 'rd';
        default:
          return 'th';
      }
    }
  }

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
            bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    "Family Background"
                        .text
                        .fontFamily(semiBold)
                        .size(18)
                        .make(),
                  ],
                ),
                20.heightBox,
                customTextFormField(
                    required: true,
                    controller: controller.familyDetails.fatherName,
                    label: "Father's Name",
                    hint: "Enter your father's name"),

                customTextFormField(
                    controller: controller.familyDetails.fatherOccupation,
                    label: "Father Occupation",
                    hint: "Enter Occupation"),

                customTextFormField(
                    required: true,
                    controller: controller.familyDetails.motherName,
                    label: "Mother's Name",
                    hint: "Enter your mother's name"),

                customTextFormField(
                    controller: controller.familyDetails.motherOccupation,
                    label: "Mother Occupation",
                    hint: "Enter Occupation"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Number of Brother's".text.fontFamily(semiBold).make(),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: controller.familyDetails.numberOfBrothers,
                        onChanged: (val) {
                          if (val != "") {
                            if (int.parse(val) <= 10) {
                              controller.setBrotherCount = int.parse(val);
                            }
                          } else {
                            controller.setBrotherCount = 0;
                          }
                        },
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ).paddingOnly(top: 20),
                Consumer<ProfileRegistrationController>(
                    builder: (context, controller, xxx) {
                  return controller.familyDetails.noOfBrother > 0
                      ? Column(
                          children: List.generate(
                            controller.familyDetails.noOfBrother,
                            (index) => siblingsInforForm(
                                name: controller
                                    .familyDetails.brothersInfo[index].name,
                                occu: controller.familyDetails
                                    .brothersInfo[index].occupation,
                                mari: controller.familyDetails
                                    .brothersInfo[index].maritalStatus,
                                title:
                                    "${index + 1}${getNumberSuffix(index + 1)}  Brother"),
                          ),
                        )
                      : SizedBox();
                }),
                // brother info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Number of Sister's".text.fontFamily(semiBold).make(),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFormField(
                        controller: controller.familyDetails.numberOfSisters,
                        onChanged: (val) {
                          print(val);
                          if (val != "") {
                            if (int.parse(val) <= 10) {
                              controller.setSisterCount = int.parse(val);
                            }
                          } else {
                            controller.setSisterCount = 0;
                          }
                        },
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ).paddingOnly(top: 20),
                // sister info
                Consumer<ProfileRegistrationController>(
                    builder: (context, controller, xxx) {
                  return controller.familyDetails.noOfSister > 0
                      ? Column(
                          children: List.generate(
                            controller.familyDetails.noOfSister,
                            (index) => siblingsInforForm(
                              occu: controller
                                  .familyDetails.sistersInfo[index].occupation,
                              name: controller
                                  .familyDetails.sistersInfo[index].name,
                              mari: controller.familyDetails.sistersInfo[index]
                                  .maritalStatus,
                              title:
                                  "${index + 1}${getNumberSuffix(index + 1)}  Sister",
                            ),
                          ),
                        )
                      : const SizedBox();
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "Number of Mama".text.fontFamily(semiBold).make(),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: TextFormField(
                        controller: controller.familyDetails.numberOfMama,
                        onChanged: (val) {
                          if (val != "") {
                            if (int.parse(val) <= 10) {
                              controller.setMamaCount = int.parse(val);
                            }
                          } else {
                            controller.setMamaCount = 0;
                          }
                        },
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ).paddingOnly(top: 20),
                Consumer<ProfileRegistrationController>(
                    builder: (context, controller, xxx) {
                  return controller.familyDetails.noOfMama > 0
                      ? Column(
                          children: List.generate(
                            controller.familyDetails.noOfMama,
                            (index) => mamaInforForm(
                              nameContro: controller
                                  .familyDetails.mamasInfo[index].name,
                              occuContro: controller
                                  .familyDetails.mamasInfo[index].occupation,
                              mobContro: controller
                                  .familyDetails.mamasInfo[index].contactNo,
                              title:
                                  "${index + 1}${getNumberSuffix(index + 1)}  Mama's",
                            ),
                          ),
                        )
                      : const SizedBox();
                }),
                Consumer<ProfileRegistrationController>(
                    builder: (context, controller, x) {
                  return controller.familyDetails.noOfMama > 0
                      ? customTextFormField(
                          controller: controller.familyDetails.mamaNativePlace,
                          label: "Mama's Native Place",
                          hint: "Enter Native Place",
                        )
                      : SizedBox();
                }),

                Consumer<ProfileRegistrationController>(
                    builder: (context, controller, xx) {
                  return FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await controller.updateRegistrationStatus(3);
                              controller.familyDetails.store();

                              GoRouter.of(context).pushReplacementNamed(
                                  ResidentialInfoScreen.id);
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

  Column siblingsInforForm({title, name, occu, mari}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextFormField(
          controller: name,
          label: "$title Name",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          controller: occu,
          label: "$title Occupation",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          controller: mari,
          label: "$title Marital Status",
          hint: "Yes / No",
        ),
      ],
    );
  }

  Column mamaInforForm(
      {title,
      nameChange,
      mobChange,
      occuChange,
      nameContro,
      occuContro,
      mobContro}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextFormField(
          controller: nameContro,
          onchange: nameChange,
          label: "$title Name",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          controller: occuContro,
          onchange: occuChange,
          label: "$title occupation",
          hint: "Enter $title occupation",
        ),
        customTextFormField(
          controller: mobContro,
          onchange: mobChange,
          label: "$title Mobile Number",
          hint: "Enter Mobile Number",
        ),
      ],
    );
  }
}
