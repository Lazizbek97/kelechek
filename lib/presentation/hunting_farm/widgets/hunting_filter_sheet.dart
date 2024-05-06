import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_chip_widget.dart';
import 'package:kelechek/core/common/widgets/cst_underline_textfield.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/core/utils/aminity_options.dart';
import 'package:kelechek/core/utils/hunting_farm_types.dart';
import 'package:kelechek/core/utils/nutrition_options.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/hunting_farm/utils/hunting_filter_payload.dart';

class HuntingFilterSheet extends StatefulWidget {
  const HuntingFilterSheet({required this.huntingFilter, super.key});

  final HuntingFilterPayload huntingFilter;

  @override
  State<HuntingFilterSheet> createState() => _HuntingFilterSheetState();
}

class _HuntingFilterSheetState extends State<HuntingFilterSheet> {
  TextEditingController fromPriceController = TextEditingController();
  TextEditingController toPriceController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;
  Set<String> selectedFeatures = {};
  Set<String> selectedNutrition = {};
  Set<String> selectedTip = {};

  @override
  void initState() {
    fromPriceController.text = widget.huntingFilter.priceFrom?.toString() ?? '';
    toPriceController.text = widget.huntingFilter.priceTo?.toString() ?? '';
    fromDate = widget.huntingFilter.rentalFrom ?? DateTime.now();
    toDate = widget.huntingFilter.rentalTo ??
        DateTime.now().add(const Duration(days: 30));

    selectedFeatures = widget.huntingFilter.amenities ?? {};
    selectedNutrition = widget.huntingFilter.nutritions ?? {};
    selectedTip = widget.huntingFilter.tip ?? {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final farmOptions = huntingFarmOptions(context);
    final mealOptions = nutritionOptions(context);
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
                                HuntingFilterPayload.initial(),
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
                                  title: l10n.check_in,
                                  fourteen:
                                      fromDate!.formatInLocaleStyle('dd MMM'),
                                ),
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: _buildDate(
                                  context,
                                  isFrom: false,
                                  title: l10n.check_out,
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
                              l10n.tip,
                              style: AppTextStyle.s19,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Wrap(
                            runSpacing: 10,
                            spacing: 8,
                            children: List<Widget>.generate(
                              farmOptions.length,
                              (index) => CstChipWidget(
                                label: farmOptions[index].id,
                                isSelected:
                                    selectedTip.contains(farmOptions[index].id),
                                onSelected: (v) {
                                  if (selectedTip.any(
                                    (element) =>
                                        element == farmOptions[index].id,
                                  )) {
                                    selectedTip.remove(farmOptions[index].id);
                                  } else {
                                    selectedTip = {
                                      ...selectedTip,
                                      farmOptions[index].id,
                                    };
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
                                  label: l10n.from,
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
                              mealOptions.length,
                              (index) => CstChipWidget(
                                label: mealOptions[index].text,
                                isSelected: selectedNutrition.contains(
                                  mealOptions[index].id,
                                ),
                                onSelected: (v) {
                                  if (selectedNutrition.any(
                                    (element) =>
                                        element == mealOptions[index].id,
                                  )) {
                                    selectedNutrition
                                        .remove(mealOptions[index].id);
                                  } else {
                                    selectedNutrition = {
                                      ...selectedNutrition,
                                      mealOptions[index].id,
                                    };
                                  }
                                  setState(() {});
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
                        HuntingFilterPayload(
                          amenities: selectedFeatures,
                          nutritions: selectedNutrition,
                          tip: selectedTip,
                          priceFrom: fromPriceController.text.isNotEmpty
                              ? int.tryParse(fromPriceController.text)
                              : null,
                          priceTo: toPriceController.text.isNotEmpty
                              ? int.tryParse(toPriceController.text)
                              : null,
                          rentalFrom: fromDate,
                          rentalTo: toDate,
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
    bool isFrom = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.s19.copyWith(
            color: AppColors.blueGray,
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
