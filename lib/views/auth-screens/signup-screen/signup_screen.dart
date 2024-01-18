import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/shared-widget/custom_auth_screens_button.dart';
import 'package:reshimgathi/shared-widget/custom_textfield.dart';
import 'package:reshimgathi/views/auth-screens/signin-screen/signin-screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: screenPadding.copyWith(top: 90, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Create an account".text.size(24).semiBold.make(),
            35.heightBox,
            customTextfield(
              title: "Name",
              hint: "Aditya Aher",
            ),
            customTextfield(
              title: "Email",
              hint: "adityaaher@gmail.com",
            ),
            customTextfield(
              title: "Password",
              hint: "********",
              ispass: true,
            ),
            40.heightBox,
            customAuthScreenButton(context, title: "Sign Up"),
            50.heightBox,
            Divider(
              thickness: 0.8,
              color: lightGrey,
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Get.to(() => SignInScreen());
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already Have an Account? ",
                    style: TextStyle(color: Vx.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: pinkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
