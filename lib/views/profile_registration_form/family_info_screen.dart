import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile_registration_form/residential_info_screen.dart';

class FamilyInfoScreen extends StatelessWidget {
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
                "Family Background".text.fontFamily(semiBold).size(18).make(),
                customTextFormField(
                    required: true,
                    controller: controller.model.fatherNameController,
                    label: "Father's Name",
                    hint: "Enter your father's name"),

                customTextFormField(
                    controller: controller.model.fatherOccupationController,
                    label: "Father Occupation",
                    hint: "Enter Occupation"),

                customTextFormField(
                    required: true,
                    controller: controller.model.motherNameController,
                    label: "Mother's Name",
                    hint: "Enter your mother's name"),

                customTextFormField(
                    controller: controller.model.motherOccupationController,
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
                  return controller.model.noOfBrother > 0
                      ? Column(
                          children: List.generate(
                            controller.model.noOfBrother,
                            (index) => siblingsInforForm(
                                occuChange: (value) {
                                  controller.model.brothersInfo[index]
                                      .occupation = value;
                                },
                                nameChange: (value) {
                                  controller.model.brothersInfo[index].name =
                                      value;
                                },
                                mariChange: (value) {
                                  controller.model.brothersInfo[index]
                                      .maritalStatus = value;
                                },
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
                        onChanged: (val) {
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
                  return controller.model.noOfSister > 0
                      ? Column(
                          children: List.generate(
                            controller.model.noOfSister,
                            (index) => siblingsInforForm(
                              occuChange: (value) {
                                controller.model.sistersInfo[index].occupation =
                                    value;
                              },
                              nameChange: (value) {
                                controller.model.sistersInfo[index].name =
                                    value;
                              },
                              mariChange: (value) {
                                controller.model.sistersInfo[index]
                                    .maritalStatus = value;
                              },
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
                  return controller.model.noOfMama > 0
                      ? Column(
                          children: List.generate(
                            controller.model.noOfMama,
                            (index) => mamaInforForm(
                              occuChange: (value) {
                                controller.model.mamasInfo[index].occupation =
                                    value;
                              },
                              nameChange: (value) {
                                controller.model.mamasInfo[index].name = value;
                              },
                              mobChange: (value) {
                                controller.model.mamasInfo[index].contactNo =
                                    value;
                              },
                              title:
                                  "${index + 1}${getNumberSuffix(index + 1)}  Mama's",
                            ),
                          ),
                        )
                      : const SizedBox();
                }),
                Consumer<ProfileRegistrationController>(
                    builder: (context, controller, x) {
                  return controller.model.noOfMama > 0
                      ? customTextFormField(
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
                              await controller.storeFamilyDetails();
                              Get.to(() => ResidentialInfoScreen());
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

  Column siblingsInforForm({title, nameChange, occuChange, mariChange}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextFormField(
          onchange: nameChange,
          label: "$title Name",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          onchange: occuChange,
          label: "$title Occupation",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          onchange: mariChange,
          label: "$title Marital Status",
          hint: "Yes / No",
        ),
      ],
    );
  }

  Column mamaInforForm({title, nameChange, mobChange, occuChange}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextFormField(
          onchange: nameChange,
          label: "$title Name",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          onchange: nameChange,
          label: "$title occupation",
          hint: "Enter $title occupation",
        ),
        customTextFormField(
          onchange: mobChange,
          label: "$title Mobile Number",
          hint: "Enter Mobile Number",
        ),
      ],
    );
  }
}
