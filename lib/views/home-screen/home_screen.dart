import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/controllers/home_screen_controller.dart';
import 'package:reshimgathi/views/home-screen/components/profiles_widget.dart';
import 'package:reshimgathi/views/home-screen/set_pref/set_preferences_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeScreenController>(context, listen: false);
    ;
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
                        size: 35,
                        color: borderColor,
                      ),
                      20.widthBox,
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
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
                    Get.to(() => SetPreferencesScreen());
                  },
                )
              ],
            ),
            20.heightBox,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Matches".text.size(22).fontFamily(semiBold).make(),
                    20.heightBox,
                    StreamBuilder<QuerySnapshot>(
                      stream: database
                          .collection('userRegister')
                          .where('profile_status', isEqualTo: {
                        'membership_active': false,
                        'verification': true,
                        'registration': true,
                      }).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.docs.isEmpty) {
                          return Center(
                              child: Text('No user registers found.'));
                        } else {
                          return ListView.builder(
                            padding: EdgeInsets.all(0),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var document = snapshot.data!.docs[index].data();

                              // Customize this widget based on your document structure
                              return ProfileCardWidget(data: document);
                            },
                          );
                        }
                      },
                    ),
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
