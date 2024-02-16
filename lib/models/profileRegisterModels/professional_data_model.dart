import 'package:reshimgathi/consts/consts.dart';
import 'package:reshimgathi/consts/shared_storage.dart';

class ProfessionalDataModel {
  TextEditingController education = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController joblocation = TextEditingController();
  TextEditingController annualincome = TextEditingController();

  ProfessionalDataModel() {
    fetch();
  }

  fetch() async {
    education.text = await shared_storage.read(key: 'education') ?? "";
    occupation.text = await shared_storage.read(key: 'occupation') ?? "";
    company.text = await shared_storage.read(key: 'companyName') ?? "";
    joblocation.text = await shared_storage.read(key: 'jobLocation') ?? "";
    annualincome.text = await shared_storage.read(key: 'annualIncome') ?? "";
  }

  store() async {
    await shared_storage.write(key: "education", value: education.text);
    await shared_storage.write(key: "occupation", value: occupation.text);
    await shared_storage.write(key: "companyName", value: company.text);
    await shared_storage.write(key: "jobLocation", value: joblocation.text);
    await shared_storage.write(key: "annualIncome", value: annualincome.text);
  }
}
