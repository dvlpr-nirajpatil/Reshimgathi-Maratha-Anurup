import 'package:reshimgathi/consts/consts.dart';

import 'package:reshimgathi/controllers/profile_screen_controller.dart';
import 'package:reshimgathi/utility/util_functions.dart';

class ProfileDetailScreen extends StatelessWidget {
  ProfileDetailScreen({super.key, required this.data}) {
    brothersList = data['brothers_info'];
    sistersList = data['sisters_info'];
    mamaList = data['mamas_info'];
  }

  dynamic data;
  late List<dynamic> brothersList;
  late List<dynamic> sistersList;
  late List<dynamic> mamaList;

  sibblingsInfo({name, occu, mariStatus}) {
    return Table(columnWidths: {
      0: FlexColumnWidth(),
      1: FlexColumnWidth(1.8),
    }, children: [
      tableRowMethod(key: "Name", value: name),
      tableRowMethod(key: "Occupation", value: occu),
      tableRowMethod(key: "Marital Status", value: mariStatus),
    ]);
  }

  mamaInfo({name, occu}) {
    return Table(columnWidths: {
      0: FlexColumnWidth(),
      1: FlexColumnWidth(1.8),
    }, children: [
      tableRowMethod(key: "Name", value: name),
      tableRowMethod(key: "Occupation", value: occu),
    ]);
  }

  Column getMamas() {
    return Column(
      children: List.generate(
        mamaList.length,
        (index) => mamaInfo(
          name: mamaList[index]['name'],
          occu: mamaList[index]['occupation'],
        ),
      ),
    );
  }

  Column getBrothers() {
    return Column(
      children: List.generate(
        brothersList.length,
        (index) => sibblingsInfo(
          name: brothersList[index]['name'],
          occu: brothersList[index]['occupation'],
          mariStatus: brothersList[index]['marital_status'],
        ),
      ),
    );
  }

  Column getSisters() {
    return Column(
      children: List.generate(
        sistersList.length,
        (index) => sibblingsInfo(
          name: sistersList[index]['name'],
          occu: sistersList[index]['occupation'],
          mariStatus: sistersList[index]['marital_status'],
        ),
      ),
    );
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
                    "${data['first_name']} ${data['last_name']}, ${calculateAge(data).toString()}"
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
                      ],
                    ),
                    15.heightBox,
                    brothersList.length > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Brothers".text.fontFamily(semiBold).make(),
                              getBrothers(),
                            ],
                          )
                        : SizedBox(),
                    sistersList.length > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Sisters".text.fontFamily(semiBold).make(),
                              getSisters(),
                            ],
                          )
                        : SizedBox(),
                    mamaList.length > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Mama".text.fontFamily(semiBold).make(),
                              getMamas(),
                              "Native Place : ${data['mama_native_place']}"
                                  .text
                                  .make()
                            ],
                          )
                        : SizedBox(),
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
                            value: "${data['expectations']['education']}"),
                        tableRowMethod(
                            key: "Max Gap",
                            value: "${data['expectations']['age_diff']}"),
                        tableRowMethod(
                            key: "Height",
                            value:
                                "${data['expectations']['height']['feet']}'${data['expectations']['height']['inch']}"),
                        tableRowMethod(
                            key: "Marital status",
                            value: "${data['expectations']['marital_status']}"),
                        // tableRowMethod(key: "Horoscope needed?", value: ""),
                        tableRowMethod(
                            key: "Mangal",
                            value:
                                "${data['expectations']['handicaped_accepted']}"),
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

  tableRowMethod({key, value}) {
    return TableRow(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 7.5),
            child: "$key : ".text.color(darkGrayColor).make()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.5),
          child: "$value".text.make(),
        ),
      ],
    );
  }
}
