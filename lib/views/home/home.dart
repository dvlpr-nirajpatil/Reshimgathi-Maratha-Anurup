import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/lists.dart';
import 'package:reshimgathi/controllers/home_screen_controller.dart';
import 'package:reshimgathi/views/home-screen/home_screen.dart';
import 'package:reshimgathi/views/profile/profile_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});
  static String id = "Home";

  List screens = [const HomeScreen(), const ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeScreenController>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child:
            Consumer<HomeScreenController>(builder: (context, provider, xxx) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomNavigationBarItems.length,
              (index) => Column(
                children: [
                  Icon(
                    bottomNavigationBarItems[index]['icon'],
                    size: 30,
                    color: provider.selectedScreenIndex == index
                        ? lightPinkColor
                        : inactiveBottomAppBarIconAndLabelColor,
                  ),
                  "${bottomNavigationBarItems[index]['title']}"
                      .text
                      .color(provider.selectedScreenIndex == index
                          ? lightPinkColor
                          : inactiveBottomAppBarIconAndLabelColor)
                      .make()
                ],
              ).onTap(() {
                controller.setScreenIndex = index;
              }),
            ),
          );
        }),
      ),
      body: Consumer<HomeScreenController>(
        builder: (context, provider, xxx) {
          return screens[controller.selectedScreenIndex];
        },
      ),
    );
  }
}
