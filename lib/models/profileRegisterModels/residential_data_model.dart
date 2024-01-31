import 'package:reshimgathi/consts/consts.dart';

class ResidentialDataModel {
  // Residential information Screen variable
  TextEditingController address = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pincode = TextEditingController();

  ResidentialDataModel() {
    fetch();
  }

  fetch() async {
    var pref = await SecureSharedPref.getInstance();
    address.text = await pref.getString("address") ?? "";
    area.text = await pref.getString('area') ?? "";
    landmark.text = await pref.getString("landmark") ?? "";
    city.text = await pref.getString("city") ?? " ";
    state.text = await pref.getString('state') ?? "";
    pincode.text = await pref.getString('pincode') ?? "";
  }

  store() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("address", address.text);
    pref.putString("area", area.text);
    pref.putString("landmark", landmark.text);
    pref.putString("city", city.text);
    pref.putString("state", state.text);
    pref.putString("pincode", pincode.text);
  }
}
