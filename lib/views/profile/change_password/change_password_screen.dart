import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile/components/options_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  static String id = "ChangePasswordScreen";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kbgColor,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: kbgColor,
        title: "Change Password".text.size(20).fontFamily(semiBold).make(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            optionsCard(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    customTextFormField(
                      required: true,
                      ispass: true,
                      label: "Old Password",
                    ),
                    customTextFormField(
                      required: true,
                      ispass: true,
                      label: "New Password",
                    ),
                    customTextFormField(
                      required: true,
                      ispass: true,
                      label: "Confirm Password",
                    ),
                    30.heightBox,
                    FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: "Change Password"
                          .text
                          .size(16)
                          .fontFamily(medium)
                          .make(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
