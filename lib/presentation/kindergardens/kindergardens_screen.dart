import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/widgets/cst_chip_widget.dart';
import 'package:kelechek/core/common/widgets/cst_empty_screen.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/home/view/home_screen.dart';
import 'package:kelechek/presentation/kindergardens/cubit/kindergarden_cubit.dart';
import 'package:kelechek/presentation/kindergardens/domain/repository/kindergarden_repository.dart';
import 'package:kelechek/presentation/kindergardens/utils/kindergarder_filter_options.dart';
import 'package:kelechek/presentation/kindergardens/widgets/rental_kindergarden_card_widget.dart';

class KinderGardensScreen extends StatelessWidget {
  const KinderGardensScreen({required this.rentalOption, super.key});

  final RentalOption rentalOption;

  @override
  Widget build(BuildContext context) {
    final ln10 = context.l10n;
    final options1 = kindergardenFilterOptions1(context);
    final options2 = kindergardenFilterOptions2(context);
    return BlocProvider(
      create: (context) => KindergardenCubit(
        kindergardenRepository: KindergardenRepository(),
      )..fetchInitialData(
          options1.first,
        ),
      child: BlocConsumer<KindergardenCubit, KindergardenState>(
        listener: (context, state) {
          if (state.errorMassage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMassage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<KindergardenCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const CustomImageView(
                  imagePath: AppIcon.menu,
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  Navigator.push(context, HomeScreen.route());
                },
              ),
              title: Text(rentalOption.title),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      '${state.kindergardenMdList.length} ${ln10.kindergardens}',
                      style: AppTextStyle.s10.copyWith(
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          constraints: const BoxConstraints(
                            maxHeight: 40,
                          ),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: options1.length,
                            itemBuilder: (context, index) => CstChipWidget(
                              onSelected: (v) {
                                print('${options1[index].id} $v');
                                cubit.filter(
                                  options1[index],
                                  remove: v,
                                );
                              },
                              isSelected:
                                  state.filter1?.id == options1[index].id,
                              label: options1[index].name,
                              bgColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          constraints: const BoxConstraints(
                            maxHeight: 40,
                          ),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: options2.length,
                            itemBuilder: (context, index) => CstChipWidget(
                              onSelected: (v) {
                                cubit.filter(
                                  options2[index],
                                  remove: v,
                                  isYearFilter: false,
                                );
                              },
                              isSelected:
                                  state.filter2?.id == options2[index].id,
                              label: options2[index].name,
                              bgColor: AppColors.primaryColor,
                              borderColor: AppColors.primaryColor,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 10),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (state.kindergardenMdList.isEmpty)
                          const SizedBox(
                            height: 400,
                            child: CstEmptyScreen(),
                          )
                        else
                          ...List.generate(
                            state.kindergardenMdList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: RentalKindergardenCardWidget(
                                kindergardenMd: state.kindergardenMdList[index],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
