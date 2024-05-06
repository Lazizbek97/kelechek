// import 'package:flutter/material.dart';
// import 'package:kelechek/core/common/widgets/custom_image_view.dart';
// import 'package:kelechek/core/constants/app_images.dart';
// import 'package:kelechek/core/constants/constants.dart';
// import 'package:kelechek/l10n/l10n.dart';
// import 'package:kelechek/presentation/rent_office_premises/widgets/custom_btn.dart';

// class UnFocusedSearchBody extends StatelessWidget {
//   const UnFocusedSearchBody({super.key, required this.isFocused});
//   final bool isFocused;

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return Expanded(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Expanded(
//               flex: 8,
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     if (isFocused) ...[
//                       CustomImageView(
//                         imagePath: AppImagePaths.search,
//                       ),
//                       SizedBox(height: 50),
//                       Text(
//                         l10n.unfortunately_nothing_found,
//                         textAlign: TextAlign.center,
//                         style: AppTextStyle.s16.copyWith(
//                           color: Color(0XFFC5C4C6),
//                         ),
//                       ),
//                     ]
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 3,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // if (isFocused)
//                   //   Padding(
//                   //     padding: EdgeInsets.only(
//                   //         bottom: MediaQuery.of(context).viewInsets.bottom),
//                   //     child: SafeArea(
//                   //       child: CustomBtn(
//                   //         height: 50,
//                   //         width: double.infinity,
//                   //         color: AppColors.primaryColor,
//                   //         title: l10n.continue_text,
//                   //         txtColor: AppColors.white,
//                   //         ontap: () {
//                   //           Navigator.pop(context);
//                   //         },
//                   //       ),
//                   //     ),
//                   //   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
