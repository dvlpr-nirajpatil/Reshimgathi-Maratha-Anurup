import 'package:reshimgathi/consts/consts.dart';

import 'package:reshimgathi/views/profile/change_password/change_password_screen.dart';
import 'package:reshimgathi/views/profile/contact_screen/contact_us_sceen.dart';
import 'package:reshimgathi/views/profile/saved_profiles/saved_profiles_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context, listen: false);
    var homeController =
        Provider.of<HomeScreenController>(context, listen: false);
    return Scaffold(
      body: Container(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightBox,
            "Profile".text.fontFamily(semiBold).size(22).make(),
            20.heightBox,
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: lightGrey,
                ),
                20.widthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Niraj Patil".text.size(18).fontFamily(semiBold).make(),
                    "${authController.userDetails['reg_id']}".text.make()
                  ],
                )
              ],
            )
                .box
                .border(color: borderColor)
                .roundedSM
                .padding(
                  EdgeInsets.all(16),
                )
                .make(),
            30.heightBox,
            Column(
              children: [
                ListTile(
                  title: "Edit Information".text.make(),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: lightPinkColor,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.to(() => SavedProfilesScreen());
                  },
                  title: "Saved Profiles".text.make(),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: lightPinkColor,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.to(() => ChangePasswordScreen());
                  },
                  title: "Change Password".text.make(),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: lightPinkColor,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: "Manage Membership".text.make(),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: lightPinkColor,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () {
                    Get.to(() => const ContactUsScreen());
                  },
                  title: "Contact Us".text.make(),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: lightPinkColor,
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () async {
                    await authController.userSignOut();
                    authController.reset();
                    homeController.reset();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  title: "Sign Out".text.make(),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: lightPinkColor,
                  ),
                ),
              ],
            ).box.border(color: borderColor).roundedSM.make(),
          ],
        ),
      ),
    );
  }
}
