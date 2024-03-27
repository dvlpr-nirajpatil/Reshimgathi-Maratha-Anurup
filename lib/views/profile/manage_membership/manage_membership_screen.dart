import 'package:flutter_svg/svg.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/views/profile/components/options_widgets.dart';

class ManageMembershipScreen extends StatelessWidget {
  const ManageMembershipScreen({super.key});
  static String id = "ManageMemebership";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kbgColor,
        title: "Membership".text.size(20).fontFamily(medium).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        width: double.infinity,
        child: Column(
          children: [
            optionsCard(
              child: Row(
                children: [
                  SvgPicture.asset(
                    igMembership,
                    width: 50,
                  ),
                  20.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Prime Membership".text.fontFamily(medium).make(),
                      "12 Months".text.size(12).color(greyTextColor).make(),
                      "Expiry : 25 April 2025"
                          .text
                          .size(12)
                          .color(greyTextColor)
                          .make()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
