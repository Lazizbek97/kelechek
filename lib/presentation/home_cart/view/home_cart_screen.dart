import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/constants/app_icons.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/cubit/home_cart_cubit.dart';
import 'package:kelechek/presentation/home_cart/view/all_orders_screen.dart';
import 'package:kelechek/presentation/home_cart/view/empty_cart_screen.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/user_profile/user_profile_screen.dart';

class HomeCartScreen extends StatelessWidget {
  const HomeCartScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const HomeCartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orders = context.select((HomeCartCubit cubit) => cubit.state.orders);
    final l10n = context.l10n;
    final user = getIt<HiveService>().getUser;
    final userNotRegistered = user == null || user.fulllName.isEmpty;
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(
          onPressed: () {
            if (userNotRegistered) {
              Navigator.pop(context);
            } else {
              context.read<MainAppCubit>().changeIndex(0);
            }
          },
        ),
        title: Text(
          l10n.orders_history,
        ),
        actions: [
          const SizedBox(
            width: 12,
          ),
          if (!userNotRegistered)
            GestureDetector(
              onTap: () {
                Navigator.push(context, UserProfileScreen.route());
              },
              child: SvgPicture.asset(
                AppIcon.settings,
                width: 24,
                height: 24,
              ),
            ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: orders.isEmpty && userNotRegistered
              ? const EmptyCardScreen()
              : const AllOrdersScreen(),
        ),
      ),
    );
  }
}
