// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:kelechek/l10n/l10n.dart';

// import '../../../core/constants/app_colors.dart';
// import '../../../core/constants/app_icons.dart';
// import '../../../core/constants/app_text_style.dart';

// class SearchField extends StatelessWidget {
//   const SearchField(
//       {super.key,
//       required this.controller,
//       required this.onEditingComplete,
//       required this.onPressed,
//       required this.onChanged});
//   final TextEditingController controller;
//   final Function onEditingComplete;
//   final Function onPressed;
//   final Function(String)? onChanged;

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return TextFormField(
//       onEditingComplete: () {
//         onEditingComplete();
//       },
//       autofocus: true,
//       onChanged: onChanged,
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: l10n.search,
//         hintStyle: AppTextStyle.s17.copyWith(
//           fontSize: 17,
//           fontWeight: FontWeight.w400,
//           color: AppColors.gray5,
//         ),
//         border: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(16),
//           ),
//           borderSide: BorderSide(
//             color: AppColors.gray5,
//           ),
//         ),
//         disabledBorder: const OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(16),
//           ),
//           borderSide: BorderSide(
//             color: AppColors.gray5,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.all(
//             Radius.circular(16),
//           ),
//           borderSide: BorderSide(
//               color: controller.text.isNotEmpty
//                   ? AppColors.lightGray
//                   : Colors.white),
//         ),
//         alignLabelWithHint: true,
//         contentPadding: EdgeInsets.zero,
//         prefixIcon: Padding(
//           padding: EdgeInsets.fromLTRB(13, 6, 13, 6),
//           child: SvgPicture.asset(
//             AppIcon.search,
//             color: AppColors.gray5,
//           ),
//         ),
//         suffixIcon: Padding(
//           padding: const EdgeInsets.fromLTRB(13, 6, 13, 6),
//           child: GestureDetector(
//             child: const Icon(
//               Icons.close,
//               color: AppColors.gray5,
//             ),
//             onTap: () {
//               onPressed();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
