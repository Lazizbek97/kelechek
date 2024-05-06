import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/office_premesis_md.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/products_list_model.dart';
import 'package:kelechek/presentation/rent_office_premises/office_details/office_details_screen.dart';

class OfficePremisesCardWidget extends StatefulWidget {
  const OfficePremisesCardWidget({
    required this.kiyal,
    super.key,
  });
  final ProductsListModel kiyal;

  @override
  State<OfficePremisesCardWidget> createState() =>
      _OfficePremisesCardWidgetState();
}

class _OfficePremisesCardWidgetState extends State<OfficePremisesCardWidget> {
  bool _isTapped = false;
  @override
  Widget build(BuildContext context) {
    String? imageUrl = '';
    if (widget.kiyal.values?.isNotEmpty ?? false) {
      try {
        imageUrl = widget.kiyal.values
            ?.firstWhere((element) => (element.fullFile ?? []).isNotEmpty)
            .fullFile
            ?.first;
      } catch (e) {
        imageUrl = '';
      }
    }
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          OfficePremisesDetailsScreen.route(
            KiyalListMd(),
            widget.kiyal.id??0
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
                      widget.kiyal.title ?? '',
                      style: AppTextStyle.s19.copyWith(
                        color: _isTapped ? AppColors.white : AppColors.darkBlue,
                      ),
                    ),
                    const SizedBox(height: 5),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${widget.kiyal.price} KGS',
                            style: AppTextStyle.s16.copyWith(
                              color: _isTapped
                                  ? AppColors.white
                                  : AppColors.darkBlue,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.kiyal.entity?.title ?? '',
                      style: AppTextStyle.s10.copyWith(
                        color:
                            _isTapped ? AppColors.white : AppColors.silverGray,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
              height: MediaQuery.of(context).size.width * 0.3,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                child: (imageUrl ?? '').isEmpty
                    ? SizedBox()
                    : CustomImageView(
                        imagePath: imageUrl,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
