import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reshimgathi/consts/consts.dart';

class ProfileDetailScreenLoadingState extends StatelessWidget {
  const ProfileDetailScreenLoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            LoadingAnimationWidget.fourRotatingDots(color: pinkColor, size: 50),
      ),
    );
  }
}
