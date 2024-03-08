import 'package:go_router/go_router.dart';
import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/lists.dart';
import 'package:reshimgathi/consts/typography.dart';
import 'package:reshimgathi/controllers/home_screen_controller.dart';

// ignore: must_be_immutable
class SetPreferencesScreen extends StatelessWidget {
  SetPreferencesScreen({super.key});
  static String id = "SetPreferences";

  int minAge = 20;
  int maxAge = 30;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<HomeScreenController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        leading: Icon(Icons.close).onTap(() {
          GoRouter.of(context).pop();
        }),
        title: "Filter Matches".text.fontFamily(semiBold).size(18).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Who you are looking for ?".text.color(lightTextColor).make(),
              20.heightBox,
              Obx(
                () => Column(
                  children: List.generate(
                    controller.prefs.length,
                    (index) => Column(
                      children: [
                        customCheckBox(
                            onChanged: (value) {
                              controller.prefs[index][1](value);
                            },
                            title: controller.prefs[index][0],
                            value: controller.prefs[index][1].value),
                        index == controller.prefs.length - 1
                            ? const SizedBox()
                            : Divider(
                                color: lightGrey,
                              ),
                      ],
                    ),
                  ),
                ).box.border(color: lightGrey).roundedSM.make(),
              ),
              20.heightBox,
              "Age".text.color(lightTextColor).make(),
              15.heightBox,
              Consumer<HomeScreenController>(builder: (context, provider, xxx) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child:
                          "Between ${provider.minAgeValue} to ${provider.maxAgeValue}"
                              .text
                              .make(),
                    ),
                    RangeSlider(
                      min: 20,
                      max: 65,
                      inactiveColor: lightGrey,
                      activeColor: pinkColor,
                      values: RangeValues(provider.minAgeValue.toDouble(),
                          provider.maxAgeValue.toDouble()),
                      onChanged: (value) {
                        provider.minAgeValue = value.start.toInt();
                        provider.maxAgeValue = value.end.toInt();
                        provider.notifyListeners();
                      },
                    ),
                  ],
                )
                    .box
                    .border(color: borderColor)
                    .roundedSM
                    .padding(
                      EdgeInsets.symmetric(vertical: 10),
                    )
                    .make();
              }),
              20.heightBox,
              "Occupation".text.color(lightTextColor).make(),
              15.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  )
                      .box
                      .border(color: borderColor)
                      .roundedSM
                      .padding(
                        EdgeInsets.symmetric(horizontal: 10),
                      )
                      .make(),
                  10.heightBox,
                  Wrap(
                    spacing: 5,
                    runSpacing: 8,
                    children: List.generate(
                      occupation.length,
                      (index) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          "${occupation[index]}".text.white.make(),
                          5.widthBox,
                          Icon(Icons.close, color: Colors.white)
                        ],
                      )
                          .box
                          .roundedSM
                          .color(pinkColor)
                          .padding(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          )
                          .make(),
                    ),
                  )
                ],
              )
                  .box
                  .border(color: borderColor)
                  .padding(
                    EdgeInsets.all(16),
                  )
                  .roundedSM
                  .make(),
              20.heightBox,
              "Location".text.color(lightTextColor).make(),
              15.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  )
                      .box
                      .border(color: borderColor)
                      .roundedSM
                      .padding(
                        EdgeInsets.symmetric(horizontal: 10),
                      )
                      .make(),
                  10.heightBox,
                  Wrap(
                    spacing: 5,
                    runSpacing: 8,
                    children: List.generate(
                      locationsList.length,
                      (index) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          "${locationsList[index]}".text.white.make(),
                          5.widthBox,
                          Icon(Icons.close, color: Colors.white)
                        ],
                      )
                          .box
                          .roundedSM
                          .color(pinkColor)
                          .padding(
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          )
                          .make(),
                    ),
                  )
                ],
              )
                  .box
                  .border(color: borderColor)
                  .padding(
                    EdgeInsets.all(16),
                  )
                  .roundedSM
                  .make()
            ],
          ),
        ),
      ),
    );
  }
}

Padding customCheckBox({title, value, onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "$title".text.make(),
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Colors.white,
          activeColor: pinkColor,
          side: BorderSide(color: pinkColor),
        )
      ],
    ),
  );
}
