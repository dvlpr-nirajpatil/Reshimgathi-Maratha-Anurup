import 'package:reshimgathi/consts/consts.dart';

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
    var pref = await SecureSharedPref.getInstance();
    education.text = await pref.getString('education') ?? "";
    occupation.text = await pref.getString('occupation') ?? "";
    company.text = await pref.getString('companyName') ?? "";
    joblocation.text = await pref.getString('jobLocation') ?? "";
    annualincome.text = await pref.getString('annualIncome') ?? "";
  }

  store() async {
    var pref = await SecureSharedPref.getInstance();
    pref.putString("education", education.text);
    pref.putString("occupation", occupation.text);
    pref.putString("companyName", company.text);
    pref.putString("jobLocation", joblocation.text);
    pref.putString("annualIncome", annualincome.text);
  }
}
