import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/residential_info_screen.dart';

class FamilyInfoScreen extends StatelessWidget {
  const FamilyInfoScreen({super.key});
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
              "Family Background".text.fontFamily(semiBold).size(18).make(),
              customTextFormField(
                  label: "Father's Name", hint: "Enter your father's name"),
              20.heightBox,
              "Is Father Alive ?".text.fontFamily(semiBold).make(),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      hint: "Yes / No",
                      selectedValue: controller.isFatherAlive,
                      onchange: (value) {
                        controller.setIsFatherAlive = value;
                      },
                      list: yesNo);
                },
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return controller.isFatherAlive == "Yes"
                      ? customTextFormField(
                          label: "Father Occupation", hint: "Enter Occupation")
                      : SizedBox();
                },
              ),
              customTextFormField(
                  label: "Mother's Name", hint: "Enter your mother's name"),
              20.heightBox,
              "Is Mother Alive ?".text.fontFamily(semiBold).make(),
              10.heightBox,
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return customDropDownButton(
                      hint: "Yes / No",
                      selectedValue: controller.isMotherAlive,
                      onchange: (value) {
                        controller.setIsMotherAlive = value;
                      },
                      list: yesNo);
                },
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return controller.isMotherAlive == "Yes"
                      ? customTextFormField(
                          label: "Mother Occupation", hint: "Enter Occupation")
                      : SizedBox();
                },
              ),
              Consumer<ProfileRegistrationController>(
                builder: (context, controller, xxx) {
                  return (controller.isFatherAlive == "No" &&
                          controller.isMotherAlive == "No")
                      ? customTextFormField(
                          label: "Guardian's Name",
                          hint: "Enter Guardian's name")
                      : SizedBox();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "Number of Brother's".text.fontFamily(semiBold).make(),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextFormField(
                      onChanged: (val) {
                        controller.setBrotherCount = int.parse(val);
                      },
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ).paddingOnly(top: 20),
              Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                return controller.noOfBrother > 0
                    ? Column(
                        children: List.generate(
                          controller.noOfBrother,
                          (index) => siblingsInforForm(
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
                        controller.setSisterCount = int.parse(val);
                      },
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ).paddingOnly(top: 20),
              // sister info
              Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                return controller.noOfSister > 0
                    ? Column(
                        children: List.generate(
                          controller.noOfSister,
                          (index) => siblingsInforForm(
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
                        controller.setMamaCount = int.parse(val);
                      },
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ).paddingOnly(top: 20),
              Consumer<ProfileRegistrationController>(
                  builder: (context, controller, xxx) {
                return controller.noOfMama > 0
                    ? Column(
                        children: List.generate(
                          controller.noOfMama,
                          (index) => mamaInforForm(
                            title:
                                "${index + 1}${getNumberSuffix(index + 1)}  Mama's",
                          ),
                        ),
                      )
                    : const SizedBox();
              }),
              Consumer<ProfileRegistrationController>(
                  builder: (context, controller, x) {
                return controller.noOfMama > 0
                    ? customTextFormField(
                        label: "Mama's Native Place",
                        hint: "Enter Native Place",
                      )
                    : SizedBox();
              }),

              FilledButton(
                      onPressed: () {
                        Get.to(() => ResidentialInfoScreen());
                      },
                      child: "Continue".text.fontFamily(semiBold).make())
                  .marginSymmetric(vertical: 40),
            ],
          ),
        ),
      ),
    );
  }

  Column siblingsInforForm({title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextFormField(
          label: "$title Name",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          label: "$title Occupation",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          label: "$title Marital Status",
          hint: "Yes / No",
        ),
      ],
    );
  }

  Column mamaInforForm({title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextFormField(
          label: "$title Name",
          hint: "Enter $title Name",
        ),
        customTextFormField(
          label: "$title Mobile Number",
          hint: "Enter Mobile Number",
        ),
      ],
    );
  }
}
