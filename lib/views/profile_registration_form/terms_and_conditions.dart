import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/terms_and_conditions.dart';
import 'package:reshimgathi/views/profile_registration_form/registration_screen.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});
  static const String id = "TermsAndCondition";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: "नियम आणि अटी"
            .text
            .fontFamily(semiBold)
            .size(24)
            .make()
            .paddingOnly(left: 20),
        actions: [
          Icon(
            Icons.logout_outlined,
            color: pinkColor,
          ).paddingOnly(right: 20).onTap(() async {
            await Provider.of<AuthController>(context, listen: false)
                .userSignOut();
            GoRouter.of(context).goNamed(SignInScreen.id);
          }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      tandC.text.align(TextAlign.justify).make(),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<ProfileRegistrationController>(
              builder: (context, controller, x) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: controller.tAndC,
                          onChanged: (value) {
                            controller.setTermsAndConditions = value;
                          },
                          checkColor: Colors.white,
                          activeColor: pinkColor,
                          side: BorderSide(color: pinkColor),
                        ),
                        "माझी सहमती आहे".text.fontFamily(semiBold).make()
                      ],
                    ),
                    FilledButton(
                            onPressed: controller.tAndC
                                ? () {
                                    GoRouter.of(context)
                                        .goNamed(RegistrationScreen.id);
                                  }
                                : null,
                            child: "Continue"
                                .text
                                .fontFamily(semiBold)
                                .size(16)
                                .make())
                        .paddingOnly(bottom: 40)
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
