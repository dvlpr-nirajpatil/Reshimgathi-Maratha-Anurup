import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/shared_storage.dart';

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
    address.text = await shared_storage.read(key: "address") ?? "";
    area.text = await shared_storage.read(key: 'area') ?? "";
    landmark.text = await shared_storage.read(key: "landmark") ?? "";
    city.text = await shared_storage.read(key: "city") ?? " ";
    state.text = await shared_storage.read(key: 'state') ?? "";
    pincode.text = await shared_storage.read(key: 'pincode') ?? "";
  }

  store() async {
    await shared_storage.write(key: "address", value: address.text);
    await shared_storage.write(key: "area", value: area.text);
    await shared_storage.write(key: "landmark", value: landmark.text);
    await shared_storage.write(key: "city", value: city.text);
    await shared_storage.write(key: "state", value: state.text);
    await shared_storage.write(key: "pincode", value: pincode.text);
  }
}
