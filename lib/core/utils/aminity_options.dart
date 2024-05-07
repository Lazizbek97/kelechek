import 'package:flutter/material.dart';
import 'package:kelechek/l10n/l10n.dart';

class AmenityOption {
  AmenityOption({
    required this.iconPath,
    required this.text,
    required this.id,
  });
  final String iconPath;
  final String text;
  final String id;
}

Map<String, AmenityOption> aminityOptions(BuildContext context) => {
      ' Wi-Fi': AmenityOption(
        iconPath: 'assets/svg/wifi.svg',
        text: context.l10n.wifi,
        id: ' Wi-Fi',
      ),
      'parking': AmenityOption(
        iconPath: 'assets/svg/carFilled.svg',
        text: context.l10n.parking,
        id: 'parking',
      ),
      'kitchen': AmenityOption(
        iconPath: 'assets/svg/kitchen.svg',
        text: context.l10n.own_kitchen,
        id: 'kitchen',
      ),
      'bath': AmenityOption(
        iconPath: 'assets/svg/bath.svg',
        text: context.l10n.bath,
        id: 'bath',
      ),
      'air-conditioning': AmenityOption(
        iconPath: 'assets/svg/snow-flake.svg',
        text: context.l10n.air_conditioning,
        id: 'air-conditioning',
      ),
    };
