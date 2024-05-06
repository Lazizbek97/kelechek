import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/core/constants/app_text_style.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/rent_office_premises/cubit/office_premises_home_cubit.dart';
import 'package:kelechek/presentation/rent_office_premises/widgets/office_premesis_card_widget.dart';

class OfficePremisesHomeBody extends StatelessWidget {
  const OfficePremisesHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OfficePremisesHomeCubit>();
    final premesises = cubit.state.kiyalList;
    final l10n = context.l10n;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                '${premesises.length} ${l10n.premises}',
                style: AppTextStyle.s10.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: premesises.length,
                itemBuilder: (context, index) => OfficePremisesCardWidget(
                  kiyal: premesises[index],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
