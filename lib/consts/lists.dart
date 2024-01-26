//bottomNavigatonBarItems

import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/profile_details_model.dart';

List bottomNavigationBarItems = [
  {"icon": Icons.home, "title": "Home"},
  {"icon": Icons.person, "title": "Profile"},
];

List<String> feets = [
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
];

List<String> inches = [
  '0',
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
];

List<String> bloodGroup = [
  'A+',
  'A-',
  'B+',
  'B-',
  'AB+',
  'AB-',
  'O+',
  'O-',
];

List<String> rasList = [
  "मेष",
  "वृषभ",
  "मिथुन",
  "कर्क",
  "सिंह",
  "कन्या",
  "तूळ",
  "वृश्चिक",
  "धनु",
  "मकर",
  "कुंभ",
  "मीन",
];

List<String> yesNo = ["Yes", "No"];

List<String> casts = ["Maratha 96k", "Maratha Kunbi"];

List<String> MaritalStatus = ["Unmarried", "Divorcee", "Widow", "Widower"];

List<String> genders = ['Male', 'Female'];

List<ProfileDetails> Matches = [
  ProfileDetails(
      name: "Isha Gupta",
      age: 21,
      occupation: "BHMS",
      location: "Pune",
      imgUrl: igGirl),
  ProfileDetails(
      name: "Pooja Dikhit",
      age: 21,
      occupation: "B.E. Computer",
      location: "Mumbai",
      imgUrl: igGirl1),
  ProfileDetails(
      name: "Jasleen Royal",
      age: 21,
      occupation: "B.Pharm",
      location: "Dhule",
      imgUrl: igGirl2),
];

List occupation = ["Engineer", "Doctor", "MBA"];
List location = ["Pune", "Mumbai", "Nashik", "Dhule"];
final RegExp emailRegex = RegExp(
  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
);
