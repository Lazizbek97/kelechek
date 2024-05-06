import 'package:flutter/material.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/cst_inkwell.dart';
import 'package:kelechek/core/common/widgets/cst_list_tile.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/user_profile/view/user_personal_details_screen.dart';
import 'package:kelechek/presentation/user_profile/view/user_settings_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const UserProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = getIt<HiveService>().getUser;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 66,
                    width: 66,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: AssetImage(AppImagePaths.profile),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.fulllName ?? '',
                          style: AppTextStyle.s16,
                        ),
                        Text(
                          '''${(user?.isForiegner ?? false) ? l10n.passport_number : l10n.inn}: ${(user?.isForiegner ?? false) ? user?.passportNumber : user?.inn}''',
                          style: AppTextStyle.s16W400.copyWith(
                            color: AppColors.lightGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: AppIcon.x,
                    width: 22,
                    height: 22,
                    color: AppColors.lightGray,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(
                color: AppColors.lightGray,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomInkWell(
                      color: AppColors.lightBlue,
                      pressedColor: AppColors.lightBlue.withOpacity(0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomImageView(
                            imagePath: AppIcon.idCard,
                            width: 40,
                            height: 40,
                            color: AppColors.white,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            l10n.passport,
                            style: AppTextStyle.s16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomInkWell(
                      color: AppColors.lightBlue,
                      pressedColor: AppColors.lightBlue.withOpacity(0.5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '3 400',
                            style: AppTextStyle.s24.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            l10n.balls,
                            style: AppTextStyle.s16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CstListTile(
                onPressed: () {
                  Navigator.push(context, UserPersonalDetailsScreen.route());
                },
                imagePath: AppIcon.profile,
                title: l10n.personal_information,
              ),
              const SizedBox(height: 15),
              CstListTile(
                onPressed: () {
                  Navigator.pop(context);
                },
                imagePath: AppIcon.package,
                title: l10n.orders_history,
              ),
              const SizedBox(height: 15),
              CstListTile(
                onPressed: () {
                  Navigator.push(context, UserSettingsScreen.route());
                },
                imagePath: AppIcon.settings,
                title: l10n.settings,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
