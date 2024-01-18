import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/models/profile_details_model.dart';
import 'package:reshimgathi/views/profile-screen/profile_detail_screen.dart';

class ProfileCardWidget extends StatelessWidget {
  ProfileCardWidget({super.key, required this.data});

  ProfileDetails data;

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
                image: AssetImage(data.imgUrl!), fit: BoxFit.cover),
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
                    data.name!.text.white.fontFamily(semiBold).size(22).make(),
                    "${data.age} Years | ${data.occupation} | ${data.location}"
                        .text
                        .white
                        .size(18)
                        .make(),
                    12.heightBox,
                  ]),
            ),
          ),
        ).marginOnly(bottom: 15),
        Positioned(
          right: 25,
          top: 25,
          child: Icon(
            data.is_fav == true
                ? Icons.favorite
                : Icons.favorite_border_outlined,
            color: data.is_fav ? pinkColor : Colors.white,
            size: 30,
          ).onTap(() {}),
        )
      ],
    ).onTap(() {
      Get.to(
          () => ProfileDetailScreen(
                data: data,
              ),
          transition: Transition.rightToLeftWithFade,
          duration: Duration(milliseconds: 500));
    });
  }
}
