import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/saved_profile_controller.dart';
import 'package:reshimgathi/services/save_profile.dart';
import 'package:reshimgathi/utility/util_functions.dart';
import 'package:reshimgathi/views/profile_details_screen/profile_detail_screen.dart';

// ignore: must_be_immutable
class ProfileCardWidget extends StatefulWidget {
  ProfileCardWidget({super.key, required this.data});
  dynamic data;

  @override
  State<ProfileCardWidget> createState() => _ProfileCardWidgetState();
}

class _ProfileCardWidgetState extends State<ProfileCardWidget> {
  // ignore: prefer_typing_uninitialized_variables

  late bool isFav;

  setFav(value) {
    setState(() {
      isFav = value;
    });

    if (value) {
      SaveProfileService.saveProfile(uid: widget.data['uid'], data: {
        "name": widget.data['first_name'],
        "age": calculateAge(widget.data),
        "occupation": widget.data['occupation'],
        "location": widget.data['job_location'],
        "profilePicture": widget.data['images'][0],
        "uid": widget.data['uid']
      });
    } else {
      SaveProfileService.unsaveProfile(uid: widget.data['uid']);
    }
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
                  "${calculateAge(widget.data).toString()} Years | ${widget.data['education']} | ${widget.data['job_location']}"
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
          child: Consumer<SavedProfilesController>(
              builder: (context, controller, _) {
            isFav = controller.savedProfiles.containsKey(widget.data['uid']);
            return Icon(
              isFav == true ? Icons.favorite : Icons.favorite_border_outlined,
              color: isFav ? pinkColor : Colors.white,
              size: 30,
            ).onTap(() {
              setFav(!isFav);
            });
          }),
        )
      ],
    ).onTap(() {
      GoRouter.of(context).goNamed(ProfileDetailScreen.id,
          pathParameters: {'id': widget.data['uid']});
    });
  }
}
