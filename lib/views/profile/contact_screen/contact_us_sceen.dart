import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: "Contact Us".text.size(18).fontFamily(semiBold).make(),
      ),
      body: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.heightBox,
            "Email".text.fontFamily(semiBold).make(),
            5.heightBox,
            "reshimgathi@gmail.com".text.color(lightTextColor).make(),
            5.heightBox,
            Divider(),
            30.heightBox,
            "Contact".text.fontFamily(semiBold).make(),
            5.heightBox,
            Row(
              children: [
                "+91 94950 90521".text.color(lightTextColor).make(),
                80.widthBox,
                "+91 94950 90521".text.color(lightTextColor).make(),
              ],
            ),
            5.heightBox,
            Divider(),
            30.heightBox,
            "Address".text.fontFamily(semiBold).make(),
            5.heightBox,
            "6, Pratik Appt, Chetana Nagar, Nashik"
                .text
                .color(lightTextColor)
                .make(),
            5.heightBox,
            Divider(),
          ],
        ),
      ),
    );
  }
}
