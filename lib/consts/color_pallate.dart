import 'package:flutter/material.dart';

// app colors
Color pinkColor = const Color(0xffFF4D82);
Color lightPinkColor = const Color(0xffFF96B5);
Color faintPinkColor = const Color(0xffFFC7D8);
Color lightGrey = const Color(0xffECEDEF);

Color darkGrayColor = Colors.grey.shade600;
Color whiteColor = Colors.white;
Color blackColor = Colors.black;

Color borderColor = const Color(0xffD9D9D9);
Color lightTextColor = const Color(0xff8C8080);

Color inactiveBottomAppBarIconAndLabelColor = Colors.grey.shade600;

Color darkGrey = Color.fromARGB(255, 197, 198, 201);

Color yellowBannerColor = Color(0xffF9CC00);
Color RedBannerColor = Color(0xffC22F20);
// ignore: non_constant_identifier_names
LinearGradient SplashScreenLinearGradient = const LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  colors: [
    Color(0xff6C2C2B),
    Color(0xffCD2D1D),
    Color(0xffCD681A),
  ],
);

Color GradientTop = Color(000000).withOpacity(0);
Color GradientMid1 = Color(000000).withOpacity(0.45);
Color GradientMid2 = Color(000000).withOpacity(0.65);
Color GradientMid3 = Color(000000).withOpacity(0.85);
Color GradientBottom = Color(000000);

LinearGradient imageCoverGradient = LinearGradient(colors: [
  // GradientMid1
  Color(0x000000).withOpacity(0.85), // GradientMid3
  Color(0x000000), // GradientBottom
], begin: Alignment.bottomCenter, end: Alignment.topCenter);
