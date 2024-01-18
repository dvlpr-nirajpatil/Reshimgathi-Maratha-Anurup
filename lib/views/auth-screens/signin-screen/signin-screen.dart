import 'package:flutter/material.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/shared-widget/custom_auth_screens_button.dart';
import 'package:reshimgathi/shared-widget/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: screenPadding.copyWith(top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Hello Again!".text.size(24).semiBold.make(),
            25.heightBox,
            customTextfield(title: "Email", hint: "adityaaher@gmail.com"),
            10.heightBox,
            customTextfield(title: "Password", hint: "*********", ispass: true),
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
            customAuthScreenButton(context, title: "Sign In"),
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
                  Get.back();
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't Have an Account? ",
                    style: TextStyle(color: Vx.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign Up",
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
