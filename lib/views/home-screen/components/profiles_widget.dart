import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/profile_details_model.dart';
import 'package:reshimgathi/views/profile_details_screen/profile_detail_screen.dart';

class ProfileCardWidget extends StatelessWidget {
  ProfileCardWidget({super.key, required this.data});

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
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.antiAlias,
          height: 450,
          width: context.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(data['images'][0].toString()),
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
                  "${data['first_name']}"
                      .text
                      .white
                      .fontFamily(semiBold)
                      .size(22)
                      .make(),
                  "${calculateAge().toString()} Years | ${data['occupation']} | ${data['job_location']}"
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
        // Positioned(
        //   right: 25,
        //   top: 25,
        //   child: Icon(
        //     data.is_fav == true
        //         ? Icons.favorite
        //         : Icons.favorite_border_outlined,
        //     color: data.is_fav ? pinkColor : Colors.white,
        //     size: 30,
        //   ).onTap(() {}),
        // )
      ],
    ).onTap(() {
      Get.to(
          () => ProfileDetailScreen(
                data: data,
              ),
          transition: Transition.rightToLeftWithFade,
          duration: Duration(milliseconds: 300));
    });
  }
}
