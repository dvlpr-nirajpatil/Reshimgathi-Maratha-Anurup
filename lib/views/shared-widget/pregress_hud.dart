import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reshimgathi/consts/consts.dart';

Stack progressHud({child, vsync, msg}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      child,
      vsync
          ? Container(
              width: double.infinity,
              height: double.infinity,
              color: faintPinkColor.withOpacity(0.3),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingAnimationWidget.fourRotatingDots(
                        color: pinkColor, size: 50),
                    20.heightBox,
                    "$msg"
                        .text
                        .bold
                        .color(pinkColor)
                        .align(TextAlign.center)
                        .make()
                  ],
                ),
              ),
            )
          : SizedBox()
    ],
  );
}
