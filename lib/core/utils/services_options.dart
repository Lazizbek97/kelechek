import 'package:flutter/material.dart';
import 'package:kelechek/l10n/l10n.dart';

class ServiceOption {
  ServiceOption({
    required this.iconPath,
    required this.text,
    required this.id,
  });
  final String iconPath;
  final String text;
  final String id;
}

List<ServiceOption> huntingFarmOptions(BuildContext context) => [
      ServiceOption(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.cottage,
        id: 'cottage',
      ),
      ServiceOption(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.tapchan,
        id: 'tapchan',
      ),
      ServiceOption(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.number,
        id: 'number',
      ),
    ];
