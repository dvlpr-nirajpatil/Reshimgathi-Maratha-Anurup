import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/controllers/profile_screen_controller.dart';
import 'package:reshimgathi/views/profile_details_screen/states/error_state.dart';
import 'package:reshimgathi/views/profile_details_screen/states/loading_state.dart';
import 'package:reshimgathi/views/profile_details_screen/states/success_state.dart';

class ProfileDetailScreen extends StatefulWidget {
  static const String id = "ProfileDetails";

  ProfileDetailScreen({super.key, required this.userid});

  String userid;

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
// function fethces the data from the database of particular userid
  Future<Map<String, dynamic>?> fetchUserData() async {
    final DocumentSnapshot<Map<String, dynamic>> snapshot =
        await database.collection(registerCollection).doc(widget.userid).get();

    if (snapshot.exists) {
      return snapshot.data();
    } else {
      return null;
    }
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller =
        Provider.of<ProfileScreenController>(context, listen: false);

    return FutureBuilder<Map<String, dynamic>?>(
      future: fetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ProfileDetailScreenLoadingState();
        } else if (snapshot.data != null) {
          final userData = snapshot.data!;
          return ProfileDetailScreenSuccessState(data: userData);
        } else {
          return ProfileDetailScreenErrorState();
        }
      },
    );
  }
}
