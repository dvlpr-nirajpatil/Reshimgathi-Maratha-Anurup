import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/controllers/profile_screen_controller.dart';
import 'package:reshimgathi/models/profile_details_model.dart';

class ProfileDetailScreen extends StatelessWidget {
  ProfileDetailScreen({super.key, required this.data});

  dynamic data;

  String convertToYYYYMMDD(String inputDate) {
    List<String> parts = inputDate.split("-");
    if (parts.length == 3) {
      String day = parts[0];
      String month = parts[1];
      String year = parts[2];
      return "$year-$month-$day";
    } else {
      // Invalid date format
      return inputDate;
    }
  }

  int calculateAge() {
    // Parse the birthdate string into a DateTime object

    String dob = data['birth_date'];

    DateTime birthDate = DateTime.parse(convertToYYYYMMDD(dob));

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Calculate the difference in years
    int age = currentDate.year - birthDate.year;

    // Check if the birthday has occurred this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileScreenController>(context, listen: false);

    var swiper = VxSwiper(
      autoPlay: data['images'].length > 1 ? true : false,
      onPageChanged: (value) {
        controller.setImageIndex = value;
      },
      aspectRatio: 16 / 16,
      viewportFraction: 1.0,
      items: List.generate(
        data['images'].length,
        (index) => Container(
          clipBehavior: Clip.antiAlias,
          width: context.width,
          height: context.height * 0.5,
          decoration: BoxDecoration(),
          child: Image(
            fit: BoxFit.contain,
            image: NetworkImage(
              data['images'][index],
            ),
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
                    Consumer<ProfileScreenController>(builder: (
                      context,
                      controller,
                      xxx,
                    ) {
                      return Positioned(
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            data['images'].length,
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
                      );
                    }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    "${data['first_name']} ${data['last_name']}, ${calculateAge().toString()}"
                        .text
                        .size(18)
                        .semiBold
                        .make(),
                    "${data['occupation']}".text.color(darkGrayColor).make(),
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
                        tableRowMethod(
                            key: "Name",
                            value:
                                "${data['first_name']} ${data['last_name']}"),
                        tableRowMethod(key: "Email", value: "${data['email']}"),
                        tableRowMethod(
                            key: "D.O.B", value: "${data['birth_date']}"),
                        tableRowMethod(
                            key: "Birth Time", value: "${data['birth_time']}"),
                        tableRowMethod(
                            key: "Height",
                            value:
                                "${data['height']['feet']}'${data['height']['inch']}"),
                        tableRowMethod(
                            key: "Education", value: "${data['education']}"),
                        tableRowMethod(
                            key: "Occupation", value: "${data['occupation']}"),
                        tableRowMethod(
                            key: "Income", value: "${data['annual_income']}"),
                        tableRowMethod(
                            key: "Blood Group",
                            value: "${data['blood_group']}"),
                        tableRowMethod(
                            key: "City & State", value: "${data['location']}"),
                        tableRowMethod(key: "Complexion", value: "Gora"),
                        tableRowMethod(
                            key: "Marital Staus",
                            value: "${data['marital_status']}"),
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
                        tableRowMethod(
                            key: "Father", value: "${data['father_name']}"),
                        tableRowMethod(
                            key: "Mother", value: "${data['mother_name']}"),
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
