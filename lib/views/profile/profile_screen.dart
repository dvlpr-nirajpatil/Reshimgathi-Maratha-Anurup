import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile/change_password/change_password_screen.dart';
import 'package:reshimgathi/views/profile/components/options_widgets.dart';
import 'package:reshimgathi/views/profile/manage_membership/manage_membership_screen.dart';
import 'package:reshimgathi/views/profile/update_information/update_information.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  TextStyle kTitleStyle = const TextStyle(fontFamily: semiBold, fontSize: 20);
  TextStyle ksubTitleStyle =
      const TextStyle(fontFamily: semiBold, fontSize: 18);
  BoxDecoration whiteBoxDecoration = BoxDecoration(
    color: kbgColor,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void _signOut(context) {
    firebaseAuth.signOut();

    GoRouter.of(context).goNamed(SignInScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    var profileDetailsController =
        Provider.of<AuthController>(context, listen: false);

    return Scaffold(
      backgroundColor: pinkColor,
      body: Container(
        padding: screenPadding.copyWith(right: 0, left: 0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Profile"
                .text
                .textStyle(kTitleStyle.copyWith(color: whiteColor))
                .make()
                .paddingSymmetric(horizontal: 20),
            Center(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      profileDetailsController.userDetails['images'][0],
                    ),
                    radius: 50,
                  ),
                  Positioned(
                    right: -5,
                    top: 60,
                    child: CircleAvatar(
                      backgroundColor: whiteColor,
                      radius: 20,
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: pinkColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            20.heightBox,
            "${firebaseAuth.currentUser!.displayName ?? "Aditya Aher"}"
                .text
                .textStyle(
                  ksubTitleStyle.copyWith(color: whiteColor),
                )
                .make()
                .centered(),
            SizedBox(
              height: context.height * 0.03,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: whiteBoxDecoration,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      optionsCard(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Registration ID"
                                    .text
                                    .fontFamily(medium)
                                    .make(),
                                "${profileDetailsController.userDetails['reg_id']}"
                                    .text
                                    .color(greyTextColor)
                                    .make(),
                              ],
                            ),
                            Divider(
                              height: 20,
                              color: lightGrey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Phone".text.fontFamily(medium).make(),
                                "${profileDetailsController.userDetails['phone'] ?? "+91 8485090521"}"
                                    .text
                                    .color(greyTextColor)
                                    .make(),
                              ],
                            ),
                            Divider(
                              height: 20,
                              color: lightGrey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                "Email".text.fontFamily(medium).make(),
                                "${profileDetailsController.userDetails['email'] ?? "+91 8485090521"}"
                                    .text
                                    .color(greyTextColor)
                                    .make(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      20.heightBox,
                      optionsCard(
                        child: Column(
                          children: [
                            optionTile(title: "Update Information").onTap(() {
                              GoRouter.of(context)
                                  .goNamed(UpdateInformationScreen.id);
                            }),
                            Divider(
                              height: 20,
                              color: lightGrey,
                            ),
                            optionTile(title: "Change Password").onTap(() {
                              GoRouter.of(context)
                                  .goNamed(ChangePasswordScreen.id);
                            }),
                            Divider(
                              height: 20,
                              color: lightGrey,
                            ),
                            optionTile(title: "Manage Membership").onTap(() {
                              GoRouter.of(context)
                                  .goNamed(ManageMembershipScreen.id);
                            }),
                          ],
                        ),
                      ),
                      20.heightBox,
                      optionsCard(
                        child: Column(
                          children: [
                            optionTile(title: "About Us").onTap(() {}),
                            Divider(
                              height: 20,
                              color: lightGrey,
                            ),
                            optionTile(title: "Contact Us").onTap(() {}),
                            Divider(
                              height: 20,
                              color: lightGrey,
                            ),
                            optionTile(title: "Sign Out").onTap(
                              () async {
                                await FirebaseAuth.instance.signOut();
                                Future.delayed(
                                  Duration.zero,
                                  () {
                                    _signOut(context);
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
