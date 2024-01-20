//bottomNavigatonBarItems

import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/models/profile_details_model.dart';

List bottomNavigationBarItems = [
  {"icon": Icons.home, "title": "Home"},
  {"icon": Icons.person, "title": "Profile"},
];

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
