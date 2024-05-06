import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_chip_widget.dart';
import 'package:kelechek/core/common/widgets/cst_underline_textfield.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/core/utils/aminity_options.dart';
import 'package:kelechek/core/utils/room_levels.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/rental_home_with_service/utils/rental_home_and_service_fitler_payload.dart';

class RentalHomeServiceFilterSheet extends StatefulWidget {
  const RentalHomeServiceFilterSheet({required this.filter, super.key});

  final RentalHomeServiceFilterPayload filter;

  @override
  State<RentalHomeServiceFilterSheet> createState() =>
      _RentalHomeServiceFilterSheetState();
}

class _RentalHomeServiceFilterSheetState
    extends State<RentalHomeServiceFilterSheet> {
  TextEditingController fromPriceController = TextEditingController();
  TextEditingController toPriceController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;
  Set<String> selectedFeatures = {};
  String selectedRoomLevel = '';
  late int floor;

  @override
  void initState() {
    fromPriceController.text = widget.filter.priceFrom?.toString() ?? '';
    toPriceController.text = widget.filter.priceTo?.toString() ?? '';
    fromDate = widget.filter.rentalFrom ?? DateTime.now();
    toDate =
        widget.filter.rentalTo ?? DateTime.now().add(const Duration(days: 30));
    selectedFeatures = widget.filter.amenities ?? {};
    selectedRoomLevel = widget.filter.roomLevel ?? '';
    floor = widget.filter.floor ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final allRoomLevels = roomlevels(context);
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
                                RentalHomeServiceFilterPayload.initial(),
                              );
                            },
                            icon: const CustomImageView(
                              imagePath: AppIcon.arrowClockWise,
                              color: AppColors.lightGray,
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
                          Text(
                            l10n.rental_period,
                            style: AppTextStyle.s19,
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
                              l10n.nutrition,
                              style: AppTextStyle.s19,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Wrap(
                            runSpacing: 10,
                            spacing: 8,
                            children: List<Widget>.generate(
                              allRoomLevels.length,
                              (index) => CstChipWidget(
                                label: allRoomLevels[index].text,
                                isSelected: selectedRoomLevel ==
                                    allRoomLevels[index].id,
                                onSelected: (v) {
                                  if (selectedRoomLevel ==
                                      allRoomLevels[index].id) {
                                    selectedRoomLevel = '';
                                  } else {
                                    selectedRoomLevel = allRoomLevels[index].id;
                                  }
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            l10n.your_budget_per_night,
                            style: AppTextStyle.s19,
                          ),
                          // const SizedBox(height: 10),
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
                            l10n.floor,
                            style: AppTextStyle.s19,
                          ),
                          const SizedBox(height: 10),
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
                            l10n.facilities,
                            style: AppTextStyle.s19,
                          ),
                          const SizedBox(height: 10),
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

                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                  CstButton(
                    text: l10n.show,
                    onPressed: () {
                      Navigator.pop(
                        context,
                        widget.filter.copyWith(
                          amenities: selectedFeatures,
                          floor: floor,
                          priceFrom: fromPriceController.text.isNotEmpty
                              ? int.tryParse(fromPriceController.text)
                              : null,
                          priceTo: toPriceController.text.isNotEmpty
                              ? int.tryParse(toPriceController.text)
                              : null,
                          rentalFrom: fromDate,
                          rentalTo: toDate,
                          roomLevel: selectedRoomLevel,
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
