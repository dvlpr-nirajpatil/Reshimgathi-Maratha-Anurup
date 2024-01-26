import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/controllers/auth_controller.dart';

import 'package:reshimgathi/views/auth_screens/signup_screen/signup_screen.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  static String id = "SignInScreen";

  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passField = TextEditingController();

  // Email validation regex pattern
  final RegExp emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: screenPadding.copyWith(top: 200),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Hello Again!".text.size(24).semiBold.make(),
              25.heightBox,
              customTextFormField(
                label: "Email",
                controller: _emailField,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              customTextFormField(
                ispass: true,
                label: "password",
                controller: _passField,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  // You can add more complex password validation logic here if needed
                  return null;
                },
              ),
              20.heightBox,
              10.heightBox,
              10.heightBox,
              Align(
                alignment: Alignment.bottomRight,
                child: "Forget Password?"
                    .text
                    .color(pinkColor)
                    .size(14)
                    .make()
                    .onTap(() {}),
              ),
              15.heightBox,
              Consumer<AuthController>(builder: (context, controller, xxx) {
                return FilledButton(
                    onPressed: () async {
                      controller.isLoading = true;
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, perform sign-in logic here
                        String email = _emailField.text;
                        String password = _passField.text;

                        authController
                            .userSignIn(context,
                                email: email, password: password)
                            .then(
                          (value) async {
                            if (value != null) {
                              await authController.navigateUser(context);
                            }
                          },
                        );
                      }
                      Future.delayed(Duration(seconds: 1), () {
                        controller.isLoading = false;
                      });
                    },
                    child: controller.is_loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : "Sign In".text.fontFamily(semiBold).size(16).make());
              }),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Dont have an account ?  ".text.make(),
                  "Sign Up!"
                      .text
                      .color(pinkColor)
                      .fontFamily(semiBold)
                      .make()
                      .onTap(() {
                    Get.to(() => SignupScreen());
                  })
                ],
              ),
              60.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
