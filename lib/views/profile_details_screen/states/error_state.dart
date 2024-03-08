import 'package:flutter/material.dart';
import 'package:reshimgathi/consts/consts.dart';

class ProfileDetailScreenErrorState extends StatelessWidget {
  const ProfileDetailScreenErrorState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: "No Profile Found".text.make(),
      ),
    );
  }
}
