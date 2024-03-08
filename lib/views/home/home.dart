import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/services/push_notifications_service.dart';
import 'package:reshimgathi/views/home-screen/home_screen.dart';
import 'package:reshimgathi/views/profile/profile_screen.dart';
import 'package:reshimgathi/views/saved_profiles/saved_profiles_screen.dart';
import 'package:reshimgathi/views/profile_requests/profile_request_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = "Home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List screens = [
    HomeScreen(),
    ProfileRequestScreen(),
    const SavedProfilesScreen(),
    const ProfileScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    bottomNavigationBarItems[index]['icon'],
                    size: context.width * 0.06,
                    color: provider.selectedScreenIndex == index
                        ? lightPinkColor
                        : inactiveBottomAppBarIconAndLabelColor,
                  ),
                  "${bottomNavigationBarItems[index]['title']}"
                      .text
                      .size(12)
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
