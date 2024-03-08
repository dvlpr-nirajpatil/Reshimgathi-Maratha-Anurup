import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';

class ContactInfoScreen extends StatelessWidget {
  ContactInfoScreen({super.key});
  static const String id = "ContactInfoScreen";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileRegistrationController>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        padding: screenPadding.copyWith(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                    bottom:
                        MediaQuery.of(context).viewInsets.bottom * 0.6 + 10),
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
                            "Contact Information"
                                .text
                                .fontFamily(semiBold)
                                .size(18)
                                .make(),
                          ],
                        ),
                        20.heightBox,
                        customTextFormField(
                          textInput: TextInputType.number,
                          controller: controller.contactDetails.fatherContactNo,
                          label: "Father's Contact No.",
                        ),
                        customTextFormField(
                          textInput: TextInputType.number,
                          controller: controller.contactDetails.motherContactNo,
                          label: "Mother's Contact No",
                        ),
                        customTextFormField(
                          required: true,
                          textInput: TextInputType.number,
                          controller: controller.contactDetails.whatsappNumber,
                          label: "WhatsApp No.",
                        ),
                        customTextFormField(
                          required: true,
                          controller: controller.contactDetails.emailAddress,
                          label: "Email",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Consumer<ProfileRegistrationController>(
                builder: (context, controller, xx) {
              return FilledButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await controller.updateRegistrationStatus(5);
                          controller.contactDetails.store();

                          GoRouter.of(context)
                              .pushReplacementNamed(ExpectionScreen.id);
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
    );
  }
}
