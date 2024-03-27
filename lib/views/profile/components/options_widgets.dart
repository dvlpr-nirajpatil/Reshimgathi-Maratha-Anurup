import 'package:reshimgathi/consts/consts.dart';

optionsCard({child}) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
        color: whiteColor, borderRadius: BorderRadius.circular(12)),
    child: child,
  );
}

SizedBox optionTile({title}) {
  return SizedBox(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        "$title".text.fontFamily(medium).make(),
        Icon(
          Icons.arrow_forward_ios,
          size: 14,
        )
      ],
    ),
  );
}
