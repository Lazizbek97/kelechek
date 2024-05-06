// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kelechek/l10n/l10n.dart';

class KindergardenFilterOption {
  final String name;
  final String id;
  KindergardenFilterOption({
    required this.name,
    required this.id,
  });
}

List<KindergardenFilterOption> kindergardenFilterOptions1(
  BuildContext context,
) =>
    [
      KindergardenFilterOption(name: context.l10n.order_status_all, id: 'all'),
      KindergardenFilterOption(
        name: '1-3 ${context.l10n.year}',
        id: '1-3',
      ),
      KindergardenFilterOption(
        name: '3-5 ${context.l10n.year}',
        id: '3-5',
      ),
      KindergardenFilterOption(
        name: '5-7 ${context.l10n.year}',
        id: '5-7',
      ),
    ];

List<KindergardenFilterOption> kindergardenFilterOptions2(
  BuildContext context,
) =>
    [
      KindergardenFilterOption(
        name: context.l10n.season_oktober,
        id: 'october',
      ),
      KindergardenFilterOption(name: context.l10n.season_may, id: 'may'),
      KindergardenFilterOption(
        name: context.l10n.sverdlovskiy,
        id: 'august',
      ),
    ];
