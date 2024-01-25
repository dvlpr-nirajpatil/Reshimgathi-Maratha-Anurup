// import 'package:reshimgathi/consts/consts.dart';
// import 'package:reshimgathi/controllers/profile_registration_controller.dart';

// SingleChildScrollView familyBackground(ProfileFormController controller) {
//   return SingleChildScrollView(
//     child: Obx(
//       () => Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             "Family Background".text.size(24).semiBold.make(),
//             35.heightBox,
//             customTextFormField(label: "Father Name", hint: "Yuvraj"),
//             10.heightBox,
//             customTextFormField(label: "Father Occupation", hint: "Note Press"),
//             10.heightBox,
//             customTextFormField(
//                 label: "Father's Company Name", hint: "Nashik Note Press"),
//             10.heightBox,
//             customTextFormField(label: "Father's Job Location", hint: "Nashik"),
//             10.heightBox,
//             customTextFormField(label: "Mother Name", hint: "Sunita"),
//             10.heightBox,
//             customTextFormField(label: "Mother Occupation", hint: "Housewife"),
//             10.heightBox,
//             Row(
//               children: [
//                 "Have Brother?".text.size(18).make(),
//                 Radio(
//                   value: 1,
//                   groupValue: controller.selectOptionBrother.value,
//                   onChanged: (value) {
//                     controller.selectOptionBrother(value);
//                   },
//                 ),
//                 "Yes".text.make(),
//                 Radio(
//                   value: 2,
//                   groupValue: controller.selectOptionBrother.value,
//                   onChanged: (value) {
//                     controller.selectOptionBrother(value);
//                   },
//                 ),
//                 "No".text.make(),
//               ],
//             ),
//             10.heightBox,
//             controller.selectOptionBrother == 1
//                 ? Row(
//                     children: [
//                       "How Many Brother you have ?".text.size(18).make(),
//                       10.widthBox,
//                       Expanded(
//                         child: TextField(
//                           onChanged: (value) {
//                             controller.brotherCount(int.parse(value));
//                           },
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             isDense: true,
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : SizedBox(),
//             10.heightBox,
//             Row(
//               children: [
//                 "Have Sister?".text.size(18).make(),
//                 14.widthBox,
//                 Radio(
//                   value: 1,
//                   groupValue: controller.selectOptionSister.value,
//                   onChanged: (value) {
//                     controller.selectOptionSister(value);
//                   },
//                 ),
//                 "Yes".text.make(),
//                 Radio(
//                   value: 2,
//                   groupValue: controller.selectOptionSister.value,
//                   onChanged: (value) {
//                     controller.selectOptionSister(value);
//                   },
//                 ),
//                 "No".text.make(),
//               ],
//             ),
//             10.heightBox,
//             controller.selectOptionSister == 1
//                 ? Row(
//                     children: [
//                       "How Many Sister you have ?".text.size(18).make(),
//                       25.widthBox,
//                       Expanded(
//                         child: TextField(
//                           controller: controller.sisterCount,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             isDense: true,
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : SizedBox(),
//             10.heightBox,
//             Row(
//               children: [
//                 "Have Mama?".text.size(18).make(),
//                 11.widthBox,
//                 Radio(
//                   value: 1,
//                   groupValue: controller.selectOptionMama.value,
//                   onChanged: (value) {
//                     controller.selectOptionMama(value);
//                   },
//                 ),
//                 "Yes".text.make(),
//                 Radio(
//                   value: 2,
//                   groupValue: controller.selectOptionMama.value,
//                   onChanged: (value) {
//                     controller.selectOptionMama(value);
//                   },
//                 ),
//                 "No".text.make(),
//               ],
//             ),
//             10.heightBox,
//             controller.selectOptionMama == 1
//                 ? Row(
//                     children: [
//                       "How Many Mama you have ?".text.size(18).make(),
//                       25.widthBox,
//                       Expanded(
//                         child: TextField(
//                           controller: controller.mamaCount,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 10),
//                             isDense: true,
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : SizedBox(),
//           ],
//         ),
//       ),
//     ),
//   );
// }
