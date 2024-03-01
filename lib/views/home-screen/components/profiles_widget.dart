import 'package:cached_network_image/cached_network_image.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/saved_profile_controller.dart';
import 'package:reshimgathi/services/save_profile.dart';
import 'package:reshimgathi/views/profile_details_screen/profile_detail_screen.dart';

// ignore: must_be_immutable
class ProfileCardWidget extends StatefulWidget {
  ProfileCardWidget({super.key, required this.data});

  dynamic data;

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  bool isFav = false;

  // ignore: prefer_typing_uninitialized_variables
  late SavedProfilesController controller;
  @override
  initState() {
    super.initState();
    controller = Provider.of<SavedProfilesController>(context, listen: false);
    isFav = controller.savedProfiles.containsKey(widget.data['uid']);
  }

  setFav(value) {
    setState(() {
      isFav = value;
    });

    if (value) {
      SaveProfileService.saveProfile(uid: widget.data['uid'], data: {
        "name": widget.data['first_name'],
        "age": calculateAge(),
        "occupation": widget.data['occupation'],
        "location": widget.data['job_location'],
        "profilePicture": widget.data['images'][0],
        "uid": widget.data['uid']
      });
    } else {
      SaveProfileService.unsaveProfile(uid: widget.data['uid']);
    }
  }

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

    String dob = widget.data['birth_date'];

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
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.antiAlias,
          height: 450,
          width: context.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  widget.data['images'][0].toString(),
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            width: context.width,
            height: 180,
            decoration: BoxDecoration(
              gradient: imageCoverGradient,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  "${widget.data['first_name']}"
                      .text
                      .white
                      .fontFamily(semiBold)
                      .size(22)
                      .make(),
                  "${calculateAge().toString()} Years | ${widget.data['education']} | ${widget.data['job_location']}"
                      .text
                      .white
                      .size(18)
                      .make(),
                  12.heightBox,
                ],
              ),
            ),
          ),
        ).marginOnly(bottom: 15),
        Positioned(
          right: 25,
          top: 25,
          child: Icon(
            isFav == true ? Icons.favorite : Icons.favorite_border_outlined,
            color: isFav ? pinkColor : Colors.white,
            size: 30,
          ).onTap(() {
            setFav(!isFav);
          }),
        )
      ],
    ).onTap(() {
      Get.to(
          () => ProfileDetailScreen(
                data: widget.data,
              ),
          transition: Transition.rightToLeftWithFade,
          duration: Duration(milliseconds: 300));
    });
  }
}
