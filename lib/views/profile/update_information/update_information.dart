import 'package:reshimgathi/consts/consts.dart';

class UpdateInformationScreen extends StatelessWidget {
  UpdateInformationScreen({super.key});

  static String id = "UpdateInformationScreen";
  TextEditingController education = TextEditingController();
  TextEditingController occupation = TextEditingController();
  TextEditingController companyname = TextEditingController();
  TextEditingController annualIncome = TextEditingController();
  TextEditingController jobLocation = TextEditingController();
  TextEditingController contact1 = TextEditingController();
  TextEditingController contact2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: SizedBox(
          height: 50,
          child: FilledButton(
            child: "Update Information".text.size(16).fontFamily(medium).make(),
            onPressed: () {},
          ).paddingSymmetric(horizontal: 6),
        ),
      ),
      backgroundColor: kbgColor,
      appBar: AppBar(
        backgroundColor: kbgColor,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: "Update Information".text.size(20).fontFamily(semiBold).make(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.02,
              ),
              "Professional Information".text.fontFamily(medium).make(),
              10.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Education".text.size(12).make(),
                  5.heightBox,
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10)),
                    ),
                  ),
                  10.heightBox,
                  "Occupation".text.size(12).make(),
                  5.heightBox,
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10)),
                    ),
                  ),
                  10.heightBox,
                  "Company/Business Name".text.size(12).make(),
                  5.heightBox,
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10)),
                    ),
                  ),
                  10.heightBox,
                  "Annual Income".text.size(12).make(),
                  5.heightBox,
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10)),
                    ),
                  ),
                  10.heightBox,
                  "Job/Business Location".text.size(12).make(),
                  5.heightBox,
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10)),
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .padding(
                    EdgeInsets.all(16),
                  )
                  .customRounded(
                    BorderRadius.circular(12),
                  )
                  .make(),
              20.heightBox,
              "Contact Information".text.fontFamily(medium).make(),
              10.heightBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Contact No 1".text.size(12).make(),
                  5.heightBox,
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10)),
                    ),
                  ),
                  10.heightBox,
                  "Contact No 2".text.size(12).make(),
                  5.heightBox,
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10)),
                    ),
                  ),
                ],
              )
                  .box
                  .white
                  .padding(
                    EdgeInsets.all(16),
                  )
                  .customRounded(
                    BorderRadius.circular(12),
                  )
                  .make(),
            ],
          ),
        ),
      ),
    );
  }
}
