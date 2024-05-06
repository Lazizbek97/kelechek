import 'package:flutter/material.dart';
import 'package:kelechek/l10n/l10n.dart';

class HuntingFarmType {
  HuntingFarmType({
    required this.iconPath,
    required this.text,
    required this.id,
  });
  final String iconPath;
  final String text;
  final String id;
}

List<HuntingFarmType> huntingFarmOptions(BuildContext context) => [
      HuntingFarmType(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.cottage,
        id: 'cottage',
      ),
      HuntingFarmType(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.tapchan,
        id: 'tapchan',
      ),
      HuntingFarmType(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.number,
        id: 'number',
      ),
    ];
