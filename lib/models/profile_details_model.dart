class ProfileDetails {
  String? imgUrl;
  String? name;
  int? age;
  String? occupation;
  String? location;
  bool is_fav = false;

  ProfileDetails(
      {this.name, this.age, this.occupation, this.location, this.imgUrl});
}
