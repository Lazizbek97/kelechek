import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/cubits/app_settings/app_settings_cubit.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/core/constants/app_text_style.dart';
import 'package:kelechek/l10n/l10n.dart';

class ChangeLanguageSettings extends StatelessWidget {
  const ChangeLanguageSettings({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ChangeLanguageSettings(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final currentLocale = l10n.localeName;
    final settings = context.select((AppSettingsCubit cubit) => cubit);
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.languageSettings),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                settings.changeAppLocale(
                  const Locale('en', 'US'),
                );
              },
              title: Text(
                'English',
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              trailing: currentLocale == 'en'
                  ? const Icon(Icons.check_rounded,
                      color: AppColors.primaryColor)
                  : null,
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(
              height: 0,
            ),
            ListTile(
              onTap: () {
                settings.changeAppLocale(
                  const Locale('ru', 'RU'),
                );
              },
              title: Text(
                'Русский',
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              trailing: currentLocale == 'ru'
                  ? const Icon(Icons.check_rounded,
                      color: AppColors.primaryColor)
                  : null,
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(
              height: 0,
            ),
            ListTile(
              onTap: () {
                settings.changeAppLocale(
                  const Locale('ky', 'KG'),
                );
              },
              title: Text(
                'Кыргызский',
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.darkBlue,
                ),
              ),
              trailing: currentLocale == 'ky'
                  ? const Icon(Icons.check_rounded,
                      color: AppColors.primaryColor)
                  : null,
              contentPadding: EdgeInsets.zero,
            ),
            const Divider(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }
}
