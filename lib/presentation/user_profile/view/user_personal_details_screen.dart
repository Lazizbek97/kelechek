import 'package:flutter/material.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';

class UserPersonalDetailsScreen extends StatelessWidget {
  const UserPersonalDetailsScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const UserPersonalDetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = getIt<HiveService>().getUser;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10n.personal_information),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              _ContentItemWidget(
                title: l10n.full_name,
                value: user?.fulllName ?? '',
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              _ContentItemWidget(
                title: (user?.isForiegner ?? false)
                    ? l10n.passport_number
                    : l10n.inn,
                value: (user?.isForiegner ?? false)
                    ? user?.passportNumber ?? ''
                    : user?.inn ?? '',
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              _ContentItemWidget(
                title: l10n.phone_number,
                value: user?.phoneNumber ?? '',
              ),
              const SizedBox(height: 16),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContentItemWidget extends StatelessWidget {
  const _ContentItemWidget({
    required this.title,
    required this.value,
    super.key,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.s16W400.copyWith(
            color: AppColors.lightGray,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: AppTextStyle.s16W400.copyWith(
              color: AppColors.blueGray,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
