import 'package:reshimgathi/consts/consts.dart';

Container splashScreenPoster(BuildContext context) {
  return Container(
    width: context.width,
    height: context.height,
    decoration: BoxDecoration(
      gradient: SplashScreenLinearGradient,
    ),
    child: Column(
      children: [
        SizedBox(
          height: context.height * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            posterWidget(img: igJijau, title: "|| जय जिजाऊ ||"),
            30.widthBox,
            posterWidget(img: igShivaji, title: "|| जय शिवराय ||"),
          ],
        ),
        40.heightBox,
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                igWedding,
                width: context.width * 0.8,
              ),
            ),
            Positioned(
              top: context.height * 0.115,
              left: 20,
              child: Image.asset(igAppLogo, width: context.width * 0.8),
            ),
            Positioned(
                bottom: -context.height * 0.1,
                right: context.width * 0.03,
                child: "मराठा अनुरुप"
                    .text
                    .fontFamily(marathiBold)
                    .size(12)
                    .white
                    .make())
          ],
        ),
        Spacer(),
        "वधु-वर सुची "
            .text
            .align(TextAlign.center)
            .size(28)
            .fontFamily(marathiBold)
            .white
            .make(),
        Spacer(),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              color: RedBannerColor,
              width: context.width,
              height: context.height * 0.14,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "मराठा सेवा संघ, धुळे संचलित"
                      .text
                      .white
                      .size(16)
                      .fontFamily(marathiBold)
                      .make(),
                  "वधु-वर सूचक व सामुदायिक विवाह कक्ष,"
                      .text
                      .white
                      .size(16)
                      .fontFamily(marathiBold)
                      .make(),
                  "धुळे जिल्हा"
                      .text
                      .white
                      .size(16)
                      .fontFamily(marathiBold)
                      .make()
                ],
              ),
            ),
            Positioned(
              bottom: 105,
              child: Container(
                padding: const EdgeInsets.all(8),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    color: yellowBannerColor, boxShadow: shadowSmall),
                child: Image.asset(
                  igLogo,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.height * 0.03,
        )
      ],
    ),
  );
}
