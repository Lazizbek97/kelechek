import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/cubits/app_settings/app_settings_cubit.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/common/widgets/rich_text_widget/base_text.dart';
import 'package:kelechek/core/common/widgets/rich_text_widget/link_text.dart';
import 'package:kelechek/core/common/widgets/rich_text_widget/rich_text_widget.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home/home_page.dart';
import 'package:kelechek/presentation/home_cart/cubit/home_cart_cubit.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/user_indentification/cubit/user_indentification_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kelechek/presentation/user_profile/view/change_language_settings.dart';

class UserSettingsScreen extends StatelessWidget {
  const UserSettingsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const UserSettingsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final settings = context.select((AppSettingsCubit cubit) => cubit);
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                l10n.currentLanguage,
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              onTap: () {
                Navigator.push(context, ChangeLanguageSettings.route());
              },
              contentPadding: EdgeInsets.zero,
              trailing: const CustomImageView(
                imagePath: AppIcon.arrowRight,
              ),
            ),
            const Divider(
              height: 0,
            ),
            BlocSelector<AppSettingsCubit, AppSettingsState, bool>(
              selector: (state) {
                return state.notificationEnabled;
              },
              builder: (context, isNotificationEnabled) {
                return ListTile(
                  onTap: () {
                    settings.changeNotificationStatus(
                      status: !isNotificationEnabled,
                    );
                  },
                  title: Text(
                    l10n.notification,
                    style: AppTextStyle.s16W400.copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                  trailing: CupertinoSwitch(
                    value: isNotificationEnabled,
                    onChanged: (value) {
                      settings.changeNotificationStatus(status: value);
                    },
                  ),
                  contentPadding: EdgeInsets.zero,
                );
              },
            ),
            const Divider(
              height: 0,
            ),
            ListTile(
              title: Text(
                l10n.terms_of_use,
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              onTap: () async {
                final Uri url = Uri.parse('https://udpgov.fun/#privacy');
                await launch(url.toString());
              },
              contentPadding: EdgeInsets.zero,
              trailing: const CustomImageView(
                imagePath: AppIcon.arrowRight,
              ),
            ),
            const Divider(
              height: 0,
            ),
            ListTile(
              title: Text(
                l10n.privacy_and_policy,
                style: AppTextStyle.s16W400.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkBlue,
                ),
              ),
              onTap: () async {
                final Uri url = Uri.parse('https://udpgov.fun/#privacy');
                await launch(url.toString());
              },
              contentPadding: EdgeInsets.zero,
              trailing: const CustomImageView(
                imagePath: AppIcon.arrowRight,
              ),
            ),
            const Divider(
              height: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            RichTextWidget(
              textAlign: TextAlign.left,
              texts: [
                BaseText(
                  text: '${l10n.you_may} ',
                  textStyle: AppTextStyle.s13.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
                LinkText(
                  text: l10n.delete,
                  onTap: () async {
                    final _url = Uri.parse('https://udpgov.fun/#contact');
                    await launchUrl(_url);
                  },
                  textStyle: AppTextStyle.s13.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                BaseText(
                  text: ' ${l10n.account_or} ',
                  textStyle: AppTextStyle.s13.copyWith(
                    color: AppColors.lightGray,
                  ),
                ),
                LinkText(
                  text: l10n.logout,
                  onTap: () async {
                    await getIt<HiveService>().clearBoxes();
                    context.read<MainAppCubit>().clear();
                    context.read<UserProfileCubit>().clear();
                    context.read<HomeCartCubit>().clear();
                    await Navigator.pushAndRemoveUntil(
                      context,
                      HomeScreen.route(),
                      (route) => false,
                    );
                  },
                  textStyle: AppTextStyle.s13.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
