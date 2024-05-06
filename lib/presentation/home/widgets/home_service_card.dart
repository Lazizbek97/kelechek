import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/main_app/main_app_screen.dart';

class HomeServiceCardWidget extends StatefulWidget {
  const HomeServiceCardWidget({
    required this.rentalOption,
    required this.overallCount,
    super.key,
  });
  final RentalOption rentalOption;
  final int overallCount;
  @override
  State<HomeServiceCardWidget> createState() => _HomeServiceCardWidgetState();
}

class _HomeServiceCardWidgetState extends State<HomeServiceCardWidget> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<MainAppCubit>().setRentalOption(widget.rentalOption);
        Navigator.pushAndRemoveUntil(
          context,
          MainAppScreen.route(
            widget.rentalOption,
          ),
          (route) => false,
        );
      },
      onTapDown: (details) => setState(() {
        _isTapped = true;
      }),
      onTapUp: (details) => setState(() {
        _isTapped = false;
      }),
      onTapCancel: () => setState(() {
        _isTapped = false;
      }),
      borderRadius: BorderRadius.circular(12),
      splashColor: AppColors.lightBlue,
      highlightColor: AppColors.lightBlue.withOpacity(0.5),
      child: Ink(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray4.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.rentalOption.title,
                    style: AppTextStyle.s19.copyWith(
                      fontWeight: FontWeight.w500,
                      color: _isTapped ? AppColors.white : AppColors.darkBlue,
                    ),
                  ),
                  const SizedBox(height: 13),
                  Text(
                    widget.rentalOption.description,
                    style: AppTextStyle.s10.copyWith(
                      color: _isTapped ? AppColors.white : AppColors.silverGray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${widget.overallCount}/',
                          style: AppTextStyle.s19.copyWith(
                            color: _isTapped
                                ? AppColors.white
                                : AppColors.darkBlue,
                          ),
                        ),
                        TextSpan(
                          text: '${widget.overallCount} ',
                          style: AppTextStyle.s19.copyWith(
                            color: _isTapped
                                ? AppColors.white
                                : AppColors.silverGray,
                          ),
                        ),
                        TextSpan(
                          text: widget.rentalOption.typeName,
                          style: AppTextStyle.s10.copyWith(
                            color: _isTapped
                                ? AppColors.white
                                : AppColors.silverGray,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 5,
                    child: LinearProgressIndicator(
                      value: 0,
                      borderRadius: BorderRadius.circular(5),
                      backgroundColor: AppColors.DFDF,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            CustomImageView(
              imagePath: widget.rentalOption.imagePath,
            ),
          ],
        ),
      ),
    );
  }
}
