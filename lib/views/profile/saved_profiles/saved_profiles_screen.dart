import 'dart:math';

import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/lists.dart';
import 'package:reshimgathi/consts/typography.dart';

class SavedProfilesScreen extends StatelessWidget {
  const SavedProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: "Saved Profiles".text.fontFamily(semiBold).size(18).make(),
      ),
      body: Container(
        child: Column(
          children: [
            Divider(
              color: Colors.grey.shade200,
            ),
            ListView.builder(
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
                      onDismissed: (DismissDirection direction) {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Image.asset(
                                  Matches[index].imgUrl!,
                                  fit: BoxFit.cover,
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
                                      "${Matches[index].name}"
                                          .text
                                          .fontFamily(semiBold)
                                          .make(),
                                      5.heightBox,
                                      "${Matches[index].age} Years | ${Matches[index].occupation} | ${Matches[index].location}"
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
                itemCount: Matches.length),
          ],
        ),
      ),
    );
  }
}
