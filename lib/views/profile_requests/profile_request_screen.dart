import 'package:cached_network_image/cached_network_image.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/request_info_controller.dart';

class ProfileRequestScreen extends StatelessWidget {
  ProfileRequestScreen({super.key});

  List<String> options = ["Accepted", "pending"];

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<RequestInfoController>(context, listen: false);
    return Scaffold(
      body: Container(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Request Profile".text.fontFamily(semiBold).size(18).make(),
            const SizedBox(height: 20),
            Consumer<RequestInfoController>(
                builder: (context, controller, xxx) {
              return Row(
                children: List.generate(
                  options.length,
                  (index) => "${options[index]}"
                      .text
                      .size(12)
                      .color(controller.selectedOptionIndex == index
                          ? Colors.white
                          : pinkColor)
                      .make()
                      .box
                      .border(color: pinkColor)
                      .color(controller.selectedOptionIndex == index
                          ? pinkColor
                          : Colors.white)
                      .padding(
                        EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      )
                      .roundedSM
                      .margin(
                        EdgeInsets.only(right: 10),
                      )
                      .make()
                      .onTap(() {
                    controller.setOption = index;
                    controller.filterList();
                  }),
                ),
              );
            }),
            10.heightBox,
            Divider(
              color: Colors.grey.shade200,
            ),
            Expanded(
              child: Consumer<RequestInfoController>(
                  builder: (context, controller, xxx) {
                return StreamBuilder<QuerySnapshot>(
                  stream: controller.selectedOptionIndex == 1
                      ? FirebaseFirestore.instance
                          .collection('infoRequests')
                          .where('user_uid',
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .where('request_status', isEqualTo: "pending")
                          .snapshots()
                      : FirebaseFirestore.instance
                          .collection('infoRequests')
                          .where('user_uid',
                              isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                          .where('request_status', isEqualTo: "accepted")
                          .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData ||
                        snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text('No requests found'),
                      );
                    } else {
                      return ListView.builder(
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var document = snapshot.data!.docs[index].data();

                          // Customize this widget based on your document structure
                          return profileRequestCardWidget(data: document);
                        },
                      );
                    }
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  profileRequestCardWidget({data}) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImage(imageUrl: data['img'])
                .box
                .size(75, 75)
                .roundedSM
                .clip(Clip.antiAlias)
                .make(),
            20.widthBox,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "${data['name']}".text.size(14).fontFamily(semiBold).make(),
                  6.heightBox,
                  "${data['age']} years | ${data['education']}"
                      .text
                      .size(12)
                      .make(),
                  6.heightBox,
                  "${data['location']} - ${data['marital_status']}"
                      .text
                      .size(12)
                      .make(),
                  6.heightBox,
                  data['request_status'] == "pending"
                      ? "Request Pending"
                          .text
                          .size(12)
                          .color(pinkColor)
                          .make()
                          .centered()
                          .box
                          .padding(
                            EdgeInsets.symmetric(vertical: 6),
                          )
                          .customRounded(
                            BorderRadius.circular(4),
                          )
                          .width(double.infinity)
                          .border(color: pinkColor)
                          .make()
                      : "View Profile Details"
                          .text
                          .size(12)
                          .white
                          .make()
                          .centered()
                          .box
                          .customRounded(
                            BorderRadius.circular(4),
                          )
                          .width(double.infinity)
                          .padding(EdgeInsets.symmetric(vertical: 6))
                          .color(pinkColor)
                          .make(),
                ],
              ),
            )
          ],
        ).box.padding(const EdgeInsets.all(12)).make(),
        Divider(
          color: Colors.grey.shade200,
        ),
      ],
    );
  }
}
