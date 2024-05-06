// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kelechek/core/common/cubits/app_settings/app_settings_cubit.dart';
// import 'package:kelechek/core/common/widgets/custom_image_view.dart';
// import 'package:kelechek/core/constants/constants.dart';
// import 'package:kelechek/l10n/l10n.dart';

// class AppSettingScreen extends StatelessWidget {
//   const AppSettingScreen({super.key});

//   static Route<void> route() {
//     return MaterialPageRoute<void>(
//       builder: (_) => const AppSettingScreen(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final settings = context.select((AppSettingsCubit cubit) => cubit);
//     final l10n = context.l10n;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(l10n.infoAboutApp),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text(
//                 l10n.notification,
//                 style: AppTextStyle.s16W400.copyWith(
//                   color: AppColors.darkBlue,
//                 ),
//               ),
//               trailing:
//                   BlocSelector<AppSettingsCubit, AppSettingsState, Locale>(
//                 selector: (state) {
//                   return state.locale;
//                 },
//                 builder: (context, locale) {
//                   return CupertinoSwitch(
//                     value: locale == const Locale('ru', 'RU'),
//                     onChanged: (value) {
//                       settings.changeAppLocale(
//                         value
//                             ? const Locale('ru', 'RU')
//                             : const Locale('en', 'US'),
//                       );
//                     },
//                   );
//                 },
//               ),
//               contentPadding: EdgeInsets.zero,
//             ),
//             const Divider(),
//             ListTile(
//               title: Text(
//                 l10n.terms_of_use,
//                 style: AppTextStyle.s16W400.copyWith(
//                   color: AppColors.darkBlue,
//                 ),
//               ),
//               onTap: () {},
//               contentPadding: EdgeInsets.zero,
//               trailing: const CustomImageView(
//                 imagePath: AppIcon.arrowRight,
//               ),
//             ),
//             const Divider(),
//             ListTile(
//               title: Text(
//               l10n.privacy_and_policy,
//                 style: AppTextStyle.s16W400.copyWith(
//                   fontWeight: FontWeight.w400,
//                   color: AppColors.darkBlue,
//                 ),
//               ),
//               onTap: () {},
//               contentPadding: EdgeInsets.zero,
//               trailing: const CustomImageView(
//                 imagePath: AppIcon.arrowRight,
//               ),
//             ),
//             const Divider(),
//           ],
//         ),
//       ),
//     );
//   }
// }
