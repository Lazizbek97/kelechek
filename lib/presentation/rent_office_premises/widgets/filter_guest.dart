import 'package:flutter/material.dart';
import 'package:kelechek/l10n/l10n.dart';

class FilterGuest extends StatelessWidget {
  const FilterGuest({super.key});

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10.show_number_of_rooms_and_guests,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
