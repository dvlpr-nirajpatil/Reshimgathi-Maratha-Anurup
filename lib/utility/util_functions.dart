DateTime dateTime = DateTime.now();
String day = dateTime.day.toString().padLeft(2, '0');
String month = dateTime.month.toString().padLeft(2, '0');
String year = dateTime.year.toString();
String hour = dateTime.hour.toString().padLeft(2, '0');
String minute = dateTime.minute.toString().padLeft(2, '0');

getDateInString() {
  String day = dateTime.day.toString().padLeft(2, '0');
  String month = dateTime.month.toString().padLeft(2, '0');
  String year = dateTime.year.toString();
  String hour = dateTime.hour.toString().padLeft(2, '0');
  String minute = dateTime.minute.toString().padLeft(2, '0');

  return "$day-$month-$year  $hour:$minute";
}
