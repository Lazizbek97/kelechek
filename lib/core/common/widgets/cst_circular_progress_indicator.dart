import 'package:flutter/material.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';

class CstCircularProgressIndicator extends StatefulWidget {
  const CstCircularProgressIndicator({
    super.key,
  });

  @override
  State<CstCircularProgressIndicator> createState() =>
      _CstCircularProgressIndicatorState();
}

class _CstCircularProgressIndicatorState
    extends State<CstCircularProgressIndicator> {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 1), () {
  //     Navigator.of(context).pop();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Center(
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.7,
              width: MediaQuery.of(context).size.width * 0.7,
              child: CircularProgressIndicator(
                strokeWidth: 30,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Color(0xffFD6746),
                ),
                backgroundColor: const Color(0xffFD6746).withOpacity(0.3),
                semanticsLabel:
                    l10n.wait_some_time_it_is_checking_verifying_data,
                semanticsValue:
                    l10n.wait_some_time_it_is_checking_verifying_data,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 200,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  l10n.wait_some_time_it_is_checking_verifying_data,
                  style: AppTextStyle.s16W400
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
