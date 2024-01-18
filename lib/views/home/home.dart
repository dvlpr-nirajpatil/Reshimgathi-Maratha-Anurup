import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/lists.dart';
import 'package:reshimgathi/controllers/home_screen_controller.dart';
import 'package:reshimgathi/views/home-screen/home_screen.dart';

import 'package:reshimgathi/views/profile/profile_screen.dart';
import 'package:reshimgathi/views/saved-profiles/saved_profile_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List screens = [
    const HomeScreen(),
    const SavedProfileScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeScreenController());
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomNavigationBarItems.length,
              (index) => Column(
                children: [
                  Icon(
                    bottomNavigationBarItems[index]['icon'],
                    size: 30,
                    color: controller.selectedScreenIndex.value == index
                        ? pinkColor
                        : inactiveBottomAppBarIconAndLabelColor,
                  ),
                  "${bottomNavigationBarItems[index]['title']}"
                      .text
                      .color(controller.selectedScreenIndex.value == index
                          ? pinkColor
                          : inactiveBottomAppBarIconAndLabelColor)
                      .make()
                ],
              ).onTap(() {
                controller.selectedScreenIndex(index);
              }),
            ),
          ),
        ),
      ),
      body: Obx(() => screens[controller.selectedScreenIndex.value]),
    );
  }
}
