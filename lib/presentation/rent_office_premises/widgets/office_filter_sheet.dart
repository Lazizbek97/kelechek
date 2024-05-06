import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_chip_widget.dart';
import 'package:kelechek/core/common/widgets/cst_underline_textfield.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/common/widgets/rich_text_widget/base_text.dart';
import 'package:kelechek/core/common/widgets/rich_text_widget/rich_text_widget.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/core/utils/aminity_options.dart';
import 'package:kelechek/l10n/l10n.dart';

import 'package:kelechek/presentation/rent_office_premises/utils/office_filter_payload.dart';

// ignore_for_file: must_be_immutable
class FilterOfficeBottomsheet extends StatefulWidget {
  const FilterOfficeBottomsheet({required this.officeFilterPayload, super.key});
  final OfficeFilterPayload officeFilterPayload;

  @override
  State<FilterOfficeBottomsheet> createState() =>
      _FilterOfficeBottomsheetState();
}

class _FilterOfficeBottomsheetState extends State<FilterOfficeBottomsheet> {
  TextEditingController fromPriceController = TextEditingController();
  TextEditingController toPriceController = TextEditingController();
  TextEditingController roomsizeController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;
  Set<String> selectedFeatures = {};

  late int floor;

  @override
  void initState() {
    fromPriceController.text =
        widget.officeFilterPayload.priceFrom?.toString() ?? '';
    toPriceController.text =
        widget.officeFilterPayload.priceTo?.toString() ?? '';
    roomsizeController.text = widget.officeFilterPayload.size?.toString() ?? '';
    fromDate = widget.officeFilterPayload.rentalFrom ?? DateTime.now();
    toDate = widget.officeFilterPayload.rentalTo ??
        DateTime.now().add(const Duration(days: 30));

    floor = widget.officeFilterPayload.floor ?? 0;
    selectedFeatures = widget.officeFilterPayload.amenities ?? {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    List<AmenityOption> aminities = aminityOptions(context).values.toList();
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Scaffold(
          body: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 32,
                          ),
                          Text(
                            l10n.filter,
                            style: AppTextStyle.s24,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                                OfficeFilterPayload.initial(),
                              );
                            },
                            icon: SizedBox(
                              child: SvgPicture.asset(
                                AppIcon.arrowClockWise,
                                color: AppColors.gray4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              l10n.rental_period,
                              style: AppTextStyle.s19,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: _buildDate(
                                  context,
                                  isFrom: true,
                                  title: l10n.from_date,
                                  fourteen:
                                      fromDate!.formatInLocaleStyle('dd MMM'),
                                ),
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: _buildDate(
                                  context,
                                  title: l10n.to_date,
                                  fourteen:
                                      toDate!.formatInLocaleStyle('dd MMM'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              l10n.floor,
                              style: AppTextStyle.s19,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Wrap(
                            runSpacing: 10,
                            spacing: 8,
                            children: List<Widget>.generate(
                              5,
                              (index) => CstChipWidget(
                                label:
                                    index == 0 ? l10n.ground_floor : '$index',
                                isSelected: floor == index,
                                onSelected: (v) {
                                  setState(() {
                                    floor = index;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            l10n.price,
                            style: AppTextStyle.s19,
                          ),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: CstUnderlineTextField(
                                  hintText: '10 000',
                                  controller: fromPriceController,
                                  label: l10n.to,
                                  suffixText: 'KGS',
                                ),
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: CstUnderlineTextField(
                                  hintText: '10 000',
                                  controller: toPriceController,
                                  label: l10n.to,
                                  suffixText: 'KGS',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            l10n.office_feature,
                            style: AppTextStyle.s19,
                          ),
                          const SizedBox(height: 15),
                          Wrap(
                            runSpacing: 13,
                            spacing: 13,
                            children: List<Widget>.generate(
                              aminities.length,
                              (index) => CstChipWidget(
                                onSelected: (p0) {
                                  if (selectedFeatures.any(
                                    (element) => element == aminities[index].id,
                                  )) {
                                    selectedFeatures
                                        .remove(aminities[index].id);
                                  } else {
                                    selectedFeatures = {
                                      ...selectedFeatures,
                                      aminities[index].id,
                                    };
                                  }
                                  setState(() {});
                                },
                                isSelected: selectedFeatures.contains(
                                  aminities[index].id,
                                ),
                                label: aminities.toList()[index].text,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          RichTextWidget(
                            texts: [
                              BaseText(
                                text: l10n.square,
                                textStyle: AppTextStyle.s19.copyWith(
                                  color: AppColors.blueGray,
                                ),
                              ),
                              BaseText(
                                text: ' (${l10n.accuracy} 3м²) ',
                                textStyle: AppTextStyle.s10.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lightGray,
                                ),
                              ),
                            ],
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: CstUnderlineTextField(
                                  hintText: '10 000',
                                  controller: roomsizeController,
                                  label: l10n.from,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'м²',
                                style: AppTextStyle.s14.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 39),
                        ],
                      ),
                    ),
                  ),
                  CstButton(
                    text: l10n.show,
                    onPressed: () {
                      Navigator.pop(
                        context,
                        OfficeFilterPayload(
                          rentalFrom: fromDate,
                          rentalTo: toDate,
                          floor: floor,
                          priceFrom: fromPriceController.text.isNotEmpty
                              ? num.tryParse(fromPriceController.text)
                              : null,
                          priceTo: toPriceController.text.isNotEmpty
                              ? num.tryParse(toPriceController.text)
                              : null,
                          size: roomsizeController.text.isNotEmpty
                              ? num.tryParse(roomsizeController.text)
                              : null,
                          amenities: selectedFeatures,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Date Widget
  Widget _buildDate(
    BuildContext context, {
    required String title,
    required String fourteen,
    bool isFrom = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.s10.copyWith(
            color: AppColors.lightGray,
          ),
        ),
        GestureDetector(
          onTap: () async {
            await showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(2030),
            ).then((value) {
              if (value != null) {
                setState(() {
                  if (isFrom) {
                    fromDate = value;
                  } else {
                    toDate = value;
                  }
                });
              }
            });
          },
          child: DropdownButton(
            hint: Text(
              fourteen,
              style: AppTextStyle.s16.copyWith(
                color: AppColors.darkBlue,
              ),
            ),
            items: const [],
            onChanged: (v) {},
            isExpanded: true,
            enableFeedback: true,
            underline: const Divider(
              height: 1,
              color: AppColors.gray4,
              thickness: 1,
            ),
            icon: const CustomImageView(
              imagePath: AppIcon.arrowDown,
              color: AppColors.gray4,
            ),
          ),
        ),
      ],
    );
  }
}
