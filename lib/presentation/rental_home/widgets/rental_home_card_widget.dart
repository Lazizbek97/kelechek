import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/presentation/rental_home/domain/models/rental_homes_list.dart';

import 'package:kelechek/presentation/rental_home/widgets/rental_home_details_screen.dart';

class RentalHomeCardWidget extends StatefulWidget {
  const RentalHomeCardWidget({
    required this.rentalHousesMd,
    super.key,
  });
  final RentalHousesMd rentalHousesMd;

  @override
  State<RentalHomeCardWidget> createState() => _RentalHomeCardWidgetState();
}

class _RentalHomeCardWidgetState extends State<RentalHomeCardWidget> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width * 0.4,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            RentalHomeDetailsScreen.route(
              rentalHousesMd: widget.rentalHousesMd,
            ),
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
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.rentalHousesMd.name ?? '',
                        style: AppTextStyle.s19.copyWith(
                          color:
                              _isTapped ? AppColors.white : AppColors.darkBlue,
                        ),
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${widget.rentalHousesMd.price} KGS',
                              style: AppTextStyle.s16.copyWith(
                                color: _isTapped
                                    ? AppColors.white
                                    : AppColors.darkBlue,
                              ),
                            ),
                            TextSpan(
                              text: ' / ',
                              style: AppTextStyle.s16.copyWith(
                                color: _isTapped
                                    ? AppColors.white
                                    : AppColors.silverGray,
                              ),
                            ),
                            TextSpan(
                              text: widget.rentalHousesMd.roomType ?? '',
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
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: 30,
                        ),
                        child: Text(
                          widget.rentalHousesMd.description ?? '',
                          style: AppTextStyle.s10.copyWith(
                            color: _isTapped
                                ? AppColors.white
                                : AppColors.silverGray,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: CustomImageView(
                    imagePath: widget.rentalHousesMd.images?.first ??
                        AppImagePaths.appIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
