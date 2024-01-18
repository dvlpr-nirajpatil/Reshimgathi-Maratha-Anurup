import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/auth-screens/profile-creation-form/shared-container/gender-1.dart';

class ProfileCreationScreen extends StatelessWidget {
  const ProfileCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileFormController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => Container(
              margin: EdgeInsets.only(right: 5),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: index == 0 ? pinkColor : lightGrey,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: screenPadding.copyWith(top: (80 * 100) / context.screenHeight),
        child: genderCheck(),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: customAuthScreenButton(context, title: "continue"),
      ),
    );
  }
}
