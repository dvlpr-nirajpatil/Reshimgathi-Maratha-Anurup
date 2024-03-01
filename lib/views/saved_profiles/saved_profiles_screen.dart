import 'package:cached_network_image/cached_network_image.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/saved_profile_controller.dart';

class SavedProfilesScreen extends StatelessWidget {
  const SavedProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<SavedProfilesController>(context, listen: false);
    var savedProfilesList = controller.savedProfiles.values.toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: "Saved Profiles".text.fontFamily(semiBold).size(18).make(),
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey.shade200,
          ),
          Expanded(
            child: Consumer<SavedProfilesController>(
                builder: (context, controller, xxx) {
              return controller.savedProfiles.length == 0
                  ? Center(
                      child: "No Saved Profiles Found".text.make(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Dismissible(
                            direction: DismissDirection.endToStart,
                            background: Container(
                                padding: EdgeInsets.only(right: 20),
                                color: Colors.redAccent,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: "Remove"
                                        .text
                                        .white
                                        .fontFamily(semiBold)
                                        .make())),
                            key: ValueKey<int>(index),
                            onDismissed: (DismissDirection direction) {
                              controller.unsaveProfile(
                                  uid: savedProfilesList[index]['uid']);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: savedProfilesList[index]
                                            ['profilePicture'],
                                      )
                                          .box
                                          .size(75, 75)
                                          .roundedSM
                                          .clip(Clip.antiAlias)
                                          .make(),
                                      30.widthBox,
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            "${savedProfilesList[index]['name']}"
                                                .text
                                                .fontFamily(semiBold)
                                                .make(),
                                            5.heightBox,
                                            "${savedProfilesList[index]['age']} Years | ${savedProfilesList[index]['location']} | ${savedProfilesList[index]['occupation']}"
                                                .text
                                                .size(12)
                                                .make()
                                          ],
                                        ),
                                      ),
                                      20.widthBox,
                                      Icon(Icons.bookmark, color: pinkColor)
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey.shade200,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: savedProfilesList.length);
            }),
          ),
        ],
      ),
    );
  }
}
