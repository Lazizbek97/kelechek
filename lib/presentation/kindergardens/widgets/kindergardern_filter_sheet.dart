// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:kelechek/core/common/widgets/cst_button.dart';
// import 'package:kelechek/core/common/widgets/cst_chip_widget.dart';
// import 'package:kelechek/core/common/widgets/cst_underline_textfield.dart';
// import 'package:kelechek/core/common/widgets/custom_image_view.dart';
// import 'package:kelechek/core/common/widgets/rich_text_widget/base_text.dart';
// import 'package:kelechek/core/common/widgets/rich_text_widget/rich_text_widget.dart';
// import 'package:kelechek/core/constants/constants.dart';
// import 'package:kelechek/l10n/l10n.dart';

// // ignore_for_file: must_be_immutable
// class KinderGardenFilterSheet extends StatelessWidget {
//   KinderGardenFilterSheet({super.key});

//   TextEditingController threeController = TextEditingController();

//   TextEditingController twoController = TextEditingController();

//   TextEditingController group4Controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return Container(
//       width: double.maxFinite,
//       constraints: BoxConstraints(
//         maxHeight: MediaQuery.of(context).size.height * 0.9,
//       ),
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 20,
//       ),
//       decoration: const BoxDecoration(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//         gradient: LinearGradient(
//           begin: Alignment(0, 1),
//           colors: [
//             AppColors.white,
//             AppColors.white,
//           ],
//         ),
//       ),
//       child: Scaffold(
//         body: SafeArea(
//           top: false,
//           child: Column(
//             children: [
//               const SizedBox(height: 6),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 2),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const SizedBox(
//                         width: 32,
//                       ),
//                       Text(
//                            l10n.filter,
//                         style: AppTextStyle.s24,
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         icon: const CustomImageView(
//                           imagePath: AppIcon.arrowClockWise,
//                           color: AppColors.lightGray,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 2),
//                         child: Text(
//                            l10n.rental_period,
//                           style: AppTextStyle.s19,
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: _buildDate(
//                               context,
//                               title: l10n.from_date,
//                               fourteen: '11 Апр',
//                             ),
//                           ),
//                           const SizedBox(width: 50),
//                           Expanded(
//                             child: _buildDate(
//                               context,
//                               title: l10n.to_date,
//                               fourteen: '14 Апр',
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 2),
//                         child: Text(
//                           l10n.floor,
//                           style: AppTextStyle.s19,
//                         ),
//                       ),
//                       const SizedBox(height: 15),
//                       Wrap(
//                         runSpacing: 10,
//                         spacing: 8,
//                         children: List<Widget>.generate(
//                           5,
//                           (index) => CstChipWidget(
//                             label: index == 0 ? l10n.ground_floor : '1',
//                             isSelected: index == 0 ? true : false,
//                             onSelected: (v) {
//                               log('onSelected');
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         l10n.price,
//                         style: AppTextStyle.s19,
//                       ),
//                       const SizedBox(height: 15),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CstUnderlineTextField(
//                               hintText: '10 000',
//                               controller: threeController,
//                               label: l10n.from,
//                               suffixText: 'KGS',
//                             ),
//                           ),
//                           const SizedBox(width: 50),
//                           Expanded(
//                             child: CstUnderlineTextField(
//                               hintText: '10 000',
//                               controller: twoController,
//                               label: l10n.to,
//                               suffixText: 'KGS',
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Text(
//                         'Особенности офиса',
//                         style: AppTextStyle.s19,
//                       ),
//                       const SizedBox(height: 15),
//                       Wrap(
//                         runSpacing: 13,
//                         spacing: 13,
//                         children: List<Widget>.generate(
//                           5,
//                           (index) => CstChipWidget(
//                             onSelected: (p0) {},
//                             isSelected: true,
//                             label: 'WiFi',
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//                       RichTextWidget(
//                         texts: [
//                           BaseText(
//                             text: 'Площадь',
//                             textStyle: AppTextStyle.s19.copyWith(
//                               color: AppColors.blueGray,
//                             ),
//                           ),
//                           BaseText(
//                             text: ' (погрешность 3м²) ',
//                             textStyle: AppTextStyle.s10.copyWith(
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.lightGray,
//                             ),
//                           ),
//                         ],
//                         textAlign: TextAlign.center,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Expanded(
//                             child: CstUnderlineTextField(
//                               hintText: '10 000',
//                               controller: group4Controller,
//                               label: 'От',
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Text(
//                             'м²',
//                             style: AppTextStyle.s14.copyWith(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 39),
//                     ],
//                   ),
//                 ),
//               ),
//               CstButton(
//                 text: l10n.show,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Date Widget
//   Widget _buildDate(
//     BuildContext context, {
//     required String title,
//     required String fourteen,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: AppTextStyle.s10.copyWith(
//             color: AppColors.lightGray,
//           ),
//         ),
//         GestureDetector(
//           onTap: () {
//             showDatePicker(
//               context: context,
//               firstDate: DateTime.now(),
//               lastDate: DateTime(2030),
//             );
//           },
//           child: DropdownButton(
//             hint: Text(
//               fourteen,
//               style: AppTextStyle.s16.copyWith(
//                 color: AppColors.darkBlue,
//               ),
//             ),
//             items: const [],
//             onChanged: (v) {},
//             isExpanded: true,
//             enableFeedback: true,
//             underline: const Divider(
//               height: 1,
//               color: AppColors.gray4,
//               thickness: 1,
//             ),
//             icon: const CustomImageView(
//               imagePath: AppIcon.arrowDown,
//               color: AppColors.gray4,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
