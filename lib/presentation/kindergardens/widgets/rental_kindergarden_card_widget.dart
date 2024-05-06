import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/kindergardens/widgets/kindergarden_details_screen.dart';

import 'package:kelechek/presentation/kindergardens/domain/models/kindergarden_list_md.dart';

class RentalKindergardenCardWidget extends StatefulWidget {
  const RentalKindergardenCardWidget({
    required this.kindergardenMd,
    super.key,
  });
  final KindergardenMd kindergardenMd;

  @override
  State<RentalKindergardenCardWidget> createState() =>
      _RentalKindergardenCardWidgetState();
}

class _RentalKindergardenCardWidgetState
    extends State<RentalKindergardenCardWidget> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    var groupCount = 0;
    widget.kindergardenMd.groups?.forEach((key, value) {
      groupCount += int.parse(value.toString());
    });
    final l10 = context.l10n;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.width * 0.35,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            KinderGardenDetailsScreen.route(
              kindergardenMd: widget.kindergardenMd,
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
                        widget.kindergardenMd.name ?? '',
                        style: AppTextStyle.s19.copyWith(
                          color:
                              _isTapped ? AppColors.white : AppColors.darkBlue,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          widget.kindergardenMd.address ?? '',
                          style: AppTextStyle.s10.copyWith(
                            color: _isTapped
                                ? AppColors.white
                                : AppColors.silverGray,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '$groupCount ${l10.available_groups}',
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
                width: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.width * 0.35,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: CustomImageView(
                    imagePath: widget.kindergardenMd.images?.first ??
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
