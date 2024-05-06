import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/cst_empty_screen.dart';
import 'package:kelechek/core/common/widgets/cst_error_screen.dart';
import 'package:kelechek/core/common/widgets/cst_loader_sceen.dart';
import 'package:kelechek/core/common/widgets/cst_network_failed_screen.dart';
import 'package:kelechek/core/network/connection_checker.dart';
// import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home/data/rental_variations_local_db.dart';
import 'package:kelechek/presentation/home/home_page.dart';

import 'package:kelechek/presentation/home/widgets/home_appbar.dart';
import 'package:kelechek/presentation/home/widgets/home_service_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(
        connectionState: getIt.get<ConnectionCheckerImpl>(),
      )..fetchData(),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: HomeBody(),
      ),
    );
  }

  static Route<void> route() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1, 0);
        const end = Offset(0, 0);
        final tween = Tween(begin: begin, end: end);
        const curve = Curves.ease;
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );
        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeStatus = context.select((HomeCubit cubit) => cubit.state.status);
    switch (homeStatus) {
      case HomeStatus.initial:
        return const CstLoadingScreen();
      case HomeStatus.loading:
        return const CstLoadingScreen();
      case HomeStatus.loaded:
        return const HomeBody();
      case HomeStatus.error:
        return const CstErrorScreen();
      case HomeStatus.empty:
        return const CstEmptyScreen();
      case HomeStatus.networkError:
        return const CstNetworkErrorScreen();
    }
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final l10 = context.l10n;
    return Column(
      children: [
        const HomeAppBar(),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                bottom: index == rentalTypes(context).length - 1 ? 100 : 0,
              ),
              child: HomeServiceCardWidget(
                rentalOption: rentalTypes(context)[index],
                overallCount: [
                  3,
                  4,
                  2,
                  4,
                  2,
                ][index],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(
              height: 16,
            ),
            itemCount: rentalTypes(context).length,
          ),
        ),
      ],
    );
  }
}
