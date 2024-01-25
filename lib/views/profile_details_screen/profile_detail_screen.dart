import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/controllers/profile_screen_controller.dart';
import 'package:reshimgathi/models/profile_details_model.dart';

class ProfileDetailScreen extends StatelessWidget {
  ProfileDetailScreen({super.key, required this.data});

  ProfileDetails data;

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileScreenController>(context, listen: false);

    var swiper = VxSwiper(
      autoPlay: true,
      onPageChanged: (value) {
        controller.imageIndex = value;
      },
      aspectRatio: 16 / 16,
      viewportFraction: 1.0,
      items: List.generate(
        3,
        (index) => Container(
          clipBehavior: Clip.antiAlias,
          width: context.width,
          height: context.height * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            data.imgUrl!,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: "Request Contact details"
            .text
            .white
            .size(16)
            .fontFamily(semiBold)
            .make()
            .centered()
            .box
            .color(pinkColor)
            .roundedSM
            .make()
            .marginAll(4),
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          Icon(
            Icons.share_outlined,
            size: 24,
          ),
          10.widthBox,
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    swiper,
                    Positioned(
                      bottom: 10,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                backgroundColor: index == controller.imageIndex
                                    ? pinkColor
                                    : lightGrey,
                                radius: 5,
                              ).onTap(() {
                                swiper.animateToPage(
                                  index,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    "${data.name}, ${data.age}".text.size(18).semiBold.make(),
                    "${data.occupation}".text.color(darkGrayColor).make(),
                    7.heightBox,
                    Divider(
                      thickness: 0.5,
                    ),
                    7.heightBox,
                    "Biodata".text.size(18).make(),
                    10.heightBox,
                    Table(
                      columnWidths: {
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(1.8),
                      },
                      children: [
                        tableRowMethod(key: "Name", value: "Shraddha Pandit"),
                        tableRowMethod(
                            key: "Email", value: "shraddhapandit@gmail.com"),
                        tableRowMethod(key: "D.O.B", value: "21 sept. 1997"),
                        tableRowMethod(key: "Birth Time", value: "6:39 PM"),
                        tableRowMethod(key: "Height", value: "5.2 Inch"),
                        tableRowMethod(
                            key: "Education",
                            value: "BE (ELECTRICAL), JETKING"),
                        tableRowMethod(
                            key: "Occupation",
                            value: "NETWORK SECURITY ASSOCIATE, IBM, PUNE"),
                        tableRowMethod(key: "Income", value: "Not specified"),
                        tableRowMethod(key: "Blood Group", value: "AB+"),
                        tableRowMethod(key: "City & State", value: "Nashik"),
                        tableRowMethod(key: "Complexion", value: "Gora"),
                        tableRowMethod(
                            key: "Marital Staus", value: "Unmarried"),
                      ],
                    ),
                    15.heightBox,
                    Divider(
                      thickness: 0.5,
                    ),
                    10.heightBox,
                    "Family Background".text.size(18).make(),
                    10.heightBox,
                    Table(
                      columnWidths: {
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(1.8),
                      },
                      children: [
                        tableRowMethod(key: "Father", value: "Lt.Mr.Chavan"),
                        tableRowMethod(
                            key: "Mother", value: "Yes, SMT. CHAVAN"),
                        tableRowMethod(
                            key: "Brother", value: "2, BOTH UNMARRIED"),
                        tableRowMethod(key: "Sister", value: "-"),
                        tableRowMethod(
                            key: "Mama", value: "Mr.Jadhav (From Nashik)"),
                      ],
                    ),
                    15.heightBox,
                    Divider(
                      thickness: 0.5,
                    ),
                    10.heightBox,
                    "Expectations".text.size(18).make(),
                    10.heightBox,
                    Table(
                      columnWidths: {
                        0: FlexColumnWidth(),
                        1: FlexColumnWidth(1.8),
                      },
                      children: [
                        tableRowMethod(
                            key: "Education",
                            value: "ENGINEER, POST GRADUATE, ANUROOP"),
                        tableRowMethod(key: "Max Gap", value: "5 Years"),
                        tableRowMethod(key: "Height", value: "0.5” Inch"),
                        tableRowMethod(
                            key: "Marital status", value: "Unmarried"),
                        tableRowMethod(key: "Horoscope needed?", value: "Yes"),
                        tableRowMethod(key: "Mangal", value: "NO"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow tableRowMethod({key, value}) {
    return TableRow(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 7.5),
            child: "${key} : ".text.color(darkGrayColor).make()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.5),
          child: "${value}".text.make(),
        ),
      ],
    );
  }
}
