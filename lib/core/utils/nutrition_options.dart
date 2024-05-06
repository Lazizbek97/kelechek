import 'package:flutter/material.dart';
import 'package:kelechek/l10n/l10n.dart';

class NutritionOption {
  NutritionOption({
    required this.iconPath,
    required this.text,
    required this.id,
  });
  final String iconPath;
  final String text;
  final String id;
}

List<NutritionOption> nutritionOptions(BuildContext context) => [
      NutritionOption(
        id: 'breakfast',
        iconPath: 'assets/svg/breakfast.svg',
        text: context.l10n.breakfast,
      ),
      NutritionOption(
        id: 'lunch',
        iconPath: 'assets/svg/lunch.svg',
        text: context.l10n.launch,
      ),
      NutritionOption(
        id: 'dinner',
        iconPath: 'assets/svg/dinner.svg',
        text: context.l10n.dinner,
      ),
    ];
