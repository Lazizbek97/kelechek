import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/cst_error_screen.dart';
import 'package:kelechek/core/common/widgets/cst_loader_sceen.dart';
import 'package:kelechek/core/common/widgets/cst_network_failed_screen.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/network/connection_checker.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/home/home_page.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/repository/office_premesis_repository.dart';
import 'package:kelechek/presentation/rent_office_premises/rent_office_premises_page.dart';
import 'package:kelechek/presentation/rent_office_premises/utils/office_filter_payload.dart';
import 'package:kelechek/presentation/rent_office_premises/widgets/office_filter_sheet.dart';
import 'package:kelechek/presentation/rent_office_premises/widgets/office_premises_home_body.dart';

class OfficePremisesHomeScreen extends StatelessWidget {
  const OfficePremisesHomeScreen({required this.rentalOption, super.key});

  final RentalOption rentalOption;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OfficePremisesHomeCubit(
        connectionChecker: getIt.get<ConnectionCheckerImpl>(),
        rentalOption: rentalOption,
        repository: OfficePremesisRepository(),
      )..load(),
      child: const _OfficePremisesHomeView(),
    );
  }
}

class _OfficePremisesHomeView extends StatelessWidget {
  const _OfficePremisesHomeView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    final status = context.watch<OfficePremisesHomeCubit>().state.status;
    final state = context.watch<OfficePremisesHomeCubit>().state;

    Widget currentScreen;
    switch (status) {
      case OfficeHomeStatus.loaded:
        currentScreen = const OfficePremisesHomeBody();
      case OfficeHomeStatus.error:
        currentScreen = const CstErrorScreen();
      case OfficeHomeStatus.networkError:
        currentScreen = const CstNetworkErrorScreen();
      case OfficeHomeStatus.loading:
        currentScreen = const CstLoadingScreen();
      case OfficeHomeStatus.initial:
        currentScreen = const CstLoadingScreen();
    }
    final cubit = context.read<OfficePremisesHomeCubit>();

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
        title: Text(cubit.rentalOption.title),
        actions: [
          IconButton(
            icon: Badge(
              smallSize: 10,
              backgroundColor: AppColors.primaryColor,
              isLabelVisible: (state.filterPayload?.filterCount ?? 0) > 0,
              child: const CustomImageView(
                imagePath: AppIcon.sliders,
                width: 24,
                height: 24,
              ),
            ),
            onPressed: () async {
              // ignore: inference_failure_on_function_invocation
              await showCupertinoModalPopup(
                context: context,
                builder: (context) => FilterOfficeBottomsheet(
                  officeFilterPayload:
                      state.filterPayload ?? OfficeFilterPayload.initial(),
                ),
              ).then((value) {
                if (value != null) {
                  // cubit.filter(value as OfficeFilterPayload);
                }
              });
            },
          ),
        ],
      ),
      body: currentScreen,
    );
  }
}
