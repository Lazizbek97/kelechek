import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/rent_office_premises/widgets/custom_btn.dart';

import '../../constants/app_icons.dart';

class QuantityFilter extends StatefulWidget {
  const QuantityFilter({super.key});

  @override
  State<QuantityFilter> createState() => _QuantityFilterState();
}

class _QuantityFilterState extends State<QuantityFilter> {
  int count = 1;
  int count2 = 1;
  int count3 = 1;
  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 32, left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10.show_number_of_rooms_and_guests,
                style: TextStyle(
                  color: Color(0xFF313952),
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10.numbera,
                    style: TextStyle(
                      color: Color(0xFF313952),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count >= 2) if (count != 1) count--;
                      });
                    },
                    child: count >= 2
                        ? SvgPicture.asset(AppIcon.minus_active)
                        : SvgPicture.asset(AppIcon.minus2),
                  ),
                  SizedBox(width: 24),
                  Text(
                    count.toString(),
                    style: TextStyle(
                      color: Color(0xFF719FFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count < 5) count++;
                      });
                    },
                    child: SvgPicture.asset(AppIcon.plus_active),
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10.adults,
                    style: TextStyle(
                      color: Color(0xFF313952),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count2 >= 2) if (count2 != 1) count2--;
                      });
                    },
                    child: count2 >= 2
                        ? SvgPicture.asset(AppIcon.minus_active)
                        : SvgPicture.asset(AppIcon.minus2),
                  ),
                  SizedBox(width: 24),
                  Text(
                    count2.toString(),
                    style: TextStyle(
                      color: Color(0xFF719FFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count2 < 5) count2++;
                      });
                    },
                    child: SvgPicture.asset(AppIcon.plus_active),
                  )
                ],
              ),
              Divider(),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Text(
                      l10.adults_from_0_to_17,
                      style: TextStyle(
                        color: Color(0xFF313952),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count3 >= 2) if (count3 != 1) count3--;
                      });
                    },
                    child: count3 >= 2
                        ? SvgPicture.asset(AppIcon.minus_active)
                        : SvgPicture.asset(AppIcon.minus2),
                  ),
                  SizedBox(width: 24),
                  Text(
                    count3.toString(),
                    style: TextStyle(
                      color: Color(0xFF719FFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (count3 < 5) count3++;
                      });
                    },
                    child: SvgPicture.asset(AppIcon.plus_active),
                  )
                ],
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: CustomBtn(
            ontap: () {
              Navigator.pop(context, [count, count2, count3]);
            },
            title: l10.continue_text,
            color: AppColors.primaryColor,
            height: 50,
            width: double.infinity,
            txtColor: AppColors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}

class QuantityItemRow extends StatefulWidget {
  const QuantityItemRow({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<QuantityItemRow> createState() => _QuantityItemRowState();
}

class _QuantityItemRowState extends State<QuantityItemRow> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: Color(0xFF313952),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              if (count >= 2) if (count != 1) count--;
            });
          },
          child: count >= 2
              ? SvgPicture.asset(AppIcon.minus_active)
              : SvgPicture.asset(AppIcon.minus2),
        ),
        SizedBox(width: 24),
        Text(
          count.toString(),
          style: TextStyle(
            color: Color(0xFF719FFF),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 24),
        GestureDetector(
          onTap: () {
            setState(() {
              if (count < 5) count++;
            });
          },
          child: SvgPicture.asset(AppIcon.plus_active),
        )
      ],
    );
  }
}
