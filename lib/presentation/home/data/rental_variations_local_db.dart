import 'package:flutter/material.dart';
import 'package:kelechek/core/constants/app_icons.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/l10n/l10n.dart';

List<RentalOption> rentalTypes(BuildContext context) => [
      RentalOption(
        // ignore: avoid_dynamic_calls
        title: context.l10n.kiyal,
        description: context.l10n.kiyal_description,
        typeName: context.l10n.available_premesis,
        imagePath: AppIcon.kiyalIllust,
        type: RentalType.kyal,
      ),
      RentalOption(
        title: context.l10n.vzmore,
        description: context.l10n.vzmore_description,
        typeName: context.l10n.available_numbers,
        imagePath: AppIcon.vzmoreIllust,
        type: RentalType.vzmore,
      ),
      RentalOption(
        title: context.l10n.vityaz,
        description: context.l10n.vityaz_description,
        typeName: context.l10n.available_numbers,
        imagePath: AppIcon.vityazIllust,
        type: RentalType.vityaz,
      ),
      RentalOption(
        title: context.l10n.kindergarden,
        description: context.l10n.kinder_garden_description,
        typeName: context.l10n.available_groups,
        imagePath: AppIcon.kindergardenIllust,
        type: RentalType.yasli,
      ),
      RentalOption(
        title: context.l10n.hunting_farm,
        description: context.l10n.hunting_farm_description,
        typeName: context.l10n.available_kotedge,
        imagePath: AppIcon.huntingFarmIllust,
        type: RentalType.oxotni,
      ),
    ];
