import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/home-screen/components/profiles_widget.dart';
import 'package:reshimgathi/views/home-screen/set_pref/set_preferences_screen.dart';
import 'package:reshimgathi/views/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;

      double delta = context.height * 0.25;

      if (maxScroll - currentScroll <= delta) {
        loadMoreProfiles();
      }
    });
  }

  loadMoreProfiles() {
    var controller = Provider.of<HomeScreenController>(context, listen: false);
    controller.getMoreProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        width: context.width,
        height: context.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 25,
                        color: borderColor,
                      ),
                      10.widthBox,
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          cursorHeight: 18,
                          onTap: () {
                            GoRouter.of(context).goNamed(SearchScreen.id);
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(
                              color: borderColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                      .box
                      .height(50)
                      .padding(
                        const EdgeInsets.symmetric(horizontal: 10),
                      )
                      .border(color: borderColor)
                      .roundedSM
                      .make(),
                ),
                10.widthBox,
                Icon(
                  Icons.tune,
                  color: pinkColor,
                )
                    .box
                    .border(color: borderColor)
                    .size(50, 50)
                    .roundedSM
                    .make()
                    .onTap(
                  () {
                    GoRouter.of(context).goNamed(SetPreferencesScreen.id);
                  },
                )
              ],
            ),
            20.heightBox,
            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Matches".text.size(22).fontFamily(semiBold).make(),
                    20.heightBox,
                    Consumer<HomeScreenController>(
                        builder: (context, controller, _) {
                      return controller.isLoading
                          ? SizedBox(
                              width: double.infinity,
                              height: context.height * 0.6,
                              child: LoadingAnimationWidget.fourRotatingDots(
                                      color: pinkColor, size: 50)
                                  .centered(),
                            )
                          : controller.profiles.length == 0
                              ? Center(
                                  child: "No Profiles Available".text.make(),
                                )
                              : ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  itemCount: controller.profiles.length - 1,
                                  itemBuilder: (context, index) {
                                    var document = controller.profiles[index]
                                        .data() as Map<String, dynamic>;
                                    // Customize this widget based on your document structure
                                    return ProfileCardWidget(
                                      data: document,
                                    );
                                  },
                                );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


  // FutureBuilder<QuerySnapshot>(
  //                     future: database
  //                         .collection('userRegister')
  //                         .where('profile_status', isEqualTo: {
  //                       'membership_active': true,
  //                       'verification': true,
  //                       'registration': true,
  //                     }).get(),
  //                     builder: (context, snapshot) {
  //                       if (snapshot.connectionState ==
  //                           ConnectionState.waiting) {
  //                         return Center(child: CircularProgressIndicator());
  //                       } else if (snapshot.hasError) {
  //                         return Center(
  //                             child: Text('Error: ${snapshot.error}'));
  //                       } else if (!snapshot.hasData ||
  //                           snapshot.data!.docs.isEmpty) {
  //                         return Center(
  //                             child: Text('No user registers found.'));
  //                       } else {
  //                         return ListView.builder(
  //                           padding: EdgeInsets.all(0),
  //                           physics: NeverScrollableScrollPhysics(),
  //                           shrinkWrap: true,
  //                           itemCount: snapshot.data!.docs.length,
  //                           itemBuilder: (context, index) {
  //                             var document = snapshot.data!.docs[index].data()
  //                                 as Map<String, dynamic>;
  //                             ;

  //                             // Customize this widget based on your document structure
  //                             return ProfileCardWidget(
  //                               data: document,
  //                             );
  //                           },
  //                         );
  //                       }
  //                     },
  //                   ),