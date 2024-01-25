import 'package:reshimgathi/consts/consts.dart';

customDropDownButton({selectedValue, onchange, list, hint}) {
  return DropdownButton<String>(
          hint: hint == null ? null : "$hint".text.color(borderColor).make(),
          icon: Icon(Icons.expand_more),
          padding: EdgeInsets.symmetric(horizontal: 12),
          elevation: 6,
          isExpanded: true,
          borderRadius: BorderRadius.circular(12),
          underline: SizedBox(),
          value: selectedValue,
          items: list.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: "$value".text.make(),
              );
            },
          ).toList(),
          onChanged: onchange)
      .box
      .border(color: borderColor)
      .customRounded(BorderRadius.circular(6))
      .make();
}
