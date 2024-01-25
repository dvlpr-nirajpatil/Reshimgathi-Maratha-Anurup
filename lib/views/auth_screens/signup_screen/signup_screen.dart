import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/lists.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/controllers/auth_controller.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/registration_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  static String id = "SignUpScreen";

  final _formKey = GlobalKey<FormState>();

  final _nameField = TextEditingController();
  final _emailField = TextEditingController();
  final _passField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      body: Container(
        padding: screenPadding.copyWith(
          top: 90,
          left: 20,
          right: 20,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.heightBox,
                "Create an account".text.size(24).semiBold.make(),
                30.heightBox,
                customTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }

                    return null;
                  },
                  controller: _nameField,
                  label: "Name",
                  hint: "Aditya Aher",
                ),
                customTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  controller: _emailField,
                  label: "Email",
                  hint: "adityaaher@gmail.com",
                ),
                customTextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 characters";
                    }

                    return null;
                  },
                  controller: _passField,
                  label: "Password",
                  hint: "********",
                  ispass: true,
                ),
                30.heightBox,
                FilledButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, perform sign-in logic here
                      String email = _emailField.text;
                      String password = _passField.text;
                      String name = _nameField.text;

                      await authController
                          .userSignUp(context, email: email, password: password)
                          .then((value) async {
                        if (value != null) {
                          await authController.storeAuthDetails(
                              name: name, email: email);
                          Get.to(() => RegistrationScreen());
                        }
                      });
                    }
                  },
                  child: "Sign Up".text.fontFamily(semiBold).size(16).make(),
                ),
                20.heightBox,
                Divider(
                  thickness: 0.8,
                  color: lightGrey,
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have an Account? "),
                    "Sign in"
                        .text
                        .fontFamily(semiBold)
                        .color(pinkColor)
                        .make()
                        .onTap(() {
                      Get.back();
                    }),
                  ],
                ),
                60.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
