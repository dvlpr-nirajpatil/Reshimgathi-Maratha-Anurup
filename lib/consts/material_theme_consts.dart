import 'package:reshimgathi/consts/consts.dart';

var appThemeData = ThemeData(
  datePickerTheme: DatePickerThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  timePickerTheme: TimePickerThemeData(
      elevation: 0,
      backgroundColor: Colors.white,
      dialBackgroundColor: Colors.white,
      hourMinuteColor: whiteColor,
      dayPeriodBorderSide: BorderSide(color: borderColor)

      // dayPeriodTextColor: Colors.white,
      ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: lightPinkColor),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: borderColor),
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: pinkColor)),
    hintStyle: TextStyle(fontSize: 16, color: darkGrey),
    isDense: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
        backgroundColor: pinkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        minimumSize: const Size(double.infinity, 45)),
  ),
  fontFamily: regular,
);
