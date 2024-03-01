import 'package:cached_network_image/cached_network_image.dart';
import 'package:reshimgathi/consts/consts.dart';

import 'package:reshimgathi/controllers/profile_screen_controller.dart';
import 'package:reshimgathi/controllers/request_info_controller.dart';
import 'package:reshimgathi/utility/util_functions.dart';

class ProfileDetailScreen extends StatefulWidget {
  ProfileDetailScreen({super.key, required this.data}) {
    brothersList = data['brothers_info'];
    sistersList = data['sisters_info'];
    mamaList = data['mamas_info'];
  }

  dynamic data;
  late List<dynamic> brothersList;
  late List<dynamic> sistersList;
  late List<dynamic> mamaList;

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  // ignore: prefer_typing_uninitialized_variables
  RequestInfoController? requestController;

  String? requestStatus;

  @override
  initState() {
    super.initState();
    requestController =
        Provider.of<RequestInfoController>(context, listen: false);
    fetchRequestStatus();
  }

  fetchRequestStatus() async {
    requestStatus = await requestController!
        .fetchRequestStatus(requestedProfile: widget.data['uid']);
    setState(() {});
  }

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
        widget.mamaList.length,
        (index) => mamaInfo(
          name: widget.mamaList[index]['name'],
          occu: widget.mamaList[index]['occupation'],
        ),
      ),
    );
  }

  Column getBrothers() {
    return Column(
      children: List.generate(
        widget.brothersList.length,
        (index) => sibblingsInfo(
          name: widget.brothersList[index]['name'],
          occu: widget.brothersList[index]['occupation'],
          mariStatus: widget.brothersList[index]['marital_status'],
        ),
      ),
    );
  }

  Column getSisters() {
    return Column(
      children: List.generate(
        widget.sistersList.length,
        (index) => sibblingsInfo(
          name: widget.sistersList[index]['name'],
          occu: widget.sistersList[index]['occupation'],
          mariStatus: widget.sistersList[index]['marital_status'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileScreenController>(context, listen: false);

    var swiper = VxSwiper(
      autoPlay: widget.data['images'].length > 1 ? true : false,
      onPageChanged: (value) {
        controller.setImageIndex = value;
      },
      aspectRatio: 16 / 16,
      viewportFraction: 1.0,
      items: List.generate(
        widget.data['images'].length,
        (index) => Container(
          clipBehavior: Clip.antiAlias,
          width: context.width,
          height: context.height * 0.5,
          decoration: BoxDecoration(),
          child: CachedNetworkImage(
            progressIndicatorBuilder: (context, str, progress) {
              return Container(
                width: context.width,
                height: context.height * 0.5,
              ).shimmer();
            },
            imageUrl: widget.data['images'][index],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: requestStatus == null
              ? "Request Contact details"
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
                  .marginAll(4)
                  .onTap(() {
                  requestController!.requestProfileInfo(
                      uid: widget.data['uid'],
                      img: widget.data['images'][0],
                      name:
                          "${widget.data['first_name']} ${widget.data['last_name']}",
                      age: calculateAge(widget.data).toString(),
                      education: widget.data['education'],
                      maristat: widget.data['marital_status'],
                      loc: widget.data['city']);
                  setState(() {
                    requestStatus = "pending";
                  });
                })
              : requestStatus == "pending"
                  ? "Request is Pending"
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
                      .marginAll(4)
                  : "View Contact details"
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
                      .marginAll(4)),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          const Icon(
            Icons.share_outlined,
            size: 24,
          ),
          10.widthBox,
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
                          widget.data['images'].length,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightBox,
                    "${widget.data['first_name']} ${widget.data['last_name']}, ${calculateAge(widget.data).toString()}"
                        .text
                        .size(18)
                        .semiBold
                        .make(),
                    "${widget.data['occupation']}"
                        .text
                        .color(darkGrayColor)
                        .make(),
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
                                "${widget.data['first_name']} ${widget.data['last_name']}"),
                        tableRowMethod(
                            key: "Email", value: "${widget.data['email']}"),
                        tableRowMethod(
                            key: "D.O.B",
                            value: "${widget.data['birth_date']}"),
                        tableRowMethod(
                            key: "Birth Time",
                            value: "${widget.data['birth_time']}"),
                        tableRowMethod(
                            key: "Height",
                            value:
                                "${widget.data['height']['feet']}'${widget.data['height']['inch']}"),
                        tableRowMethod(
                            key: "Education",
                            value: "${widget.data['education']}"),
                        tableRowMethod(
                            key: "Occupation",
                            value: "${widget.data['occupation']}"),
                        tableRowMethod(
                            key: "Income",
                            value: "${widget.data['annual_income']}"),
                        tableRowMethod(
                            key: "Blood Group",
                            value: "${widget.data['blood_group']}"),
                        tableRowMethod(
                            key: "City & State",
                            value: "${widget.data['city']}"),
                        tableRowMethod(key: "Complexion", value: "Gora"),
                        tableRowMethod(
                            key: "Marital Staus",
                            value: "${widget.data['marital_status']}"),
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
                            key: "Father",
                            value: "${widget.data['father_name']}"),
                        tableRowMethod(
                            key: "Mother",
                            value: "${widget.data['mother_name']}"),
                      ],
                    ),
                    15.heightBox,
                    widget.brothersList.length > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Brothers".text.fontFamily(semiBold).make(),
                              getBrothers(),
                            ],
                          )
                        : SizedBox(),
                    widget.sistersList.length > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Sisters".text.fontFamily(semiBold).make(),
                              getSisters(),
                            ],
                          )
                        : SizedBox(),
                    widget.mamaList.length > 0
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Mama".text.fontFamily(semiBold).make(),
                              getMamas(),
                              "Native Place : ${widget.data['mama_native_place']}"
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
                            value:
                                "${widget.data['expectations']['education']}"),
                        tableRowMethod(
                            key: "Max Gap",
                            value:
                                "${widget.data['expectations']['age_diff']}"),
                        tableRowMethod(
                            key: "Height",
                            value:
                                "${widget.data['expectations']['height']['feet']}'${widget.data['expectations']['height']['inch']}"),
                        tableRowMethod(
                            key: "Marital status",
                            value:
                                "${widget.data['expectations']['marital_status']}"),
                        // tableRowMethod(key: "Horoscope needed?", value: ""),
                        tableRowMethod(
                            key: "Mangal",
                            value:
                                "${widget.data['expectations']['handicaped_accepted']}"),
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
