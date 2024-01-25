import 'package:reshimgathi/consts/consts.dart';

SingleChildScrollView ResidentialInformation() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Residential Information".text.size(24).semiBold.make(),
        20.heightBox,
        customTextFormField(
          label: "Flat, House no, Apartment",
          hint: "sail zill ro-house no 2",
        ),
        customTextFormField(
          label: "Landmark",
          hint: "Behind Minatai thakare school",
        ),
        customTextFormField(
          label: "Area",
          hint: "DGP Nagar 2",
        ),
        customTextFormField(
          label: "City / Town",
          hint: "Nashik",
        ),
        customTextFormField(
          label: "State",
          hint: "Maharashtra",
        ),
        customTextFormField(
            label: "Pincode", hint: "422010", textInput: TextInputType.number),
      ],
    ),
  );
}
