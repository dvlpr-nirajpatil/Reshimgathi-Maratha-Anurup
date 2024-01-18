import 'package:reshimgathi/consts/consts.dart';

SingleChildScrollView ResidentialInformation() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Residential Information".text.size(24).semiBold.make(),
        20.heightBox,
        customTextfield(
          title: "Flat, House no, Apartment",
          hint: "sail zill ro-house no 2",
        ),
        customTextfield(
          title: "Landmark",
          hint: "Behind Minatai thakare school",
        ),
        customTextfield(
          title: "Area",
          hint: "DGP Nagar 2",
        ),
        customTextfield(
          title: "City / Town",
          hint: "Nashik",
        ),
        customTextfield(
          title: "State",
          hint: "Maharashtra",
        ),
        customTextfield(
            title: "Pincode", hint: "422010", textInput: TextInputType.number),
      ],
    ),
  );
}
