DateTime dateTime = DateTime.now();
String day = dateTime.day.toString().padLeft(2, '0');
String month = dateTime.month.toString().padLeft(2, '0');
String year = dateTime.year.toString();
String hour = dateTime.hour.toString().padLeft(2, '0');
String minute = dateTime.minute.toString().padLeft(2, '0');

getDateTimeInString() {
  String day = dateTime.day.toString().padLeft(2, '0');
  String month = dateTime.month.toString().padLeft(2, '0');
  String year = dateTime.year.toString();
  String hour = dateTime.hour.toString().padLeft(2, '0');
  String minute = dateTime.minute.toString().padLeft(2, '0');

  return "$day-$month-$year  $hour:$minute";
}

String convertToYYYYMMDD(String inputDate) {
  List<String> parts = inputDate.split("-");
  if (parts.length == 3) {
    String day = parts[0];
    String month = parts[1];
    String year = parts[2];
    return "$year-$month-$day";
  } else {
    // Invalid date format
    return inputDate;
  }
}

int calculateAge(data) {
  // Parse the birthdate string into a DateTime object

  String dob = data['birth_date'];

  DateTime birthDate = DateTime.parse(convertToYYYYMMDD(dob));

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the difference in years
  int age = currentDate.year - birthDate.year;

  // Check if the birthday has occurred this year
  if (currentDate.month < birthDate.month ||
      (currentDate.month == birthDate.month &&
          currentDate.day < birthDate.day)) {
    age--;
  }

  return age;
}
