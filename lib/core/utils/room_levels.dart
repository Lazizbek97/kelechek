import 'package:flutter/material.dart';
import 'package:kelechek/l10n/l10n.dart';

class RoomLevel {
  RoomLevel({
    required this.iconPath,
    required this.text,
    required this.id,
  });
  final String iconPath;
  final String text;
  final String id;
}

List<RoomLevel> roomlevels(BuildContext context) => [
      RoomLevel(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.standart,
        id: 'standart',
      ),
      RoomLevel(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.junior_suite,
        id: 'junior_suite',
      ),
      RoomLevel(
        iconPath: 'assets/svg/hunting.svg',
        text: context.l10n.lux,
        id: 'lux',
      ),
    ];
