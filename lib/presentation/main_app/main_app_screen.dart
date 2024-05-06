import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/presentation/home/data/rental_option.dart';
import 'package:kelechek/presentation/home_cart/view/home_cart_screen.dart';
import 'package:kelechek/presentation/home_chat/view/home_chat_screen.dart';
import 'package:kelechek/presentation/home_search/widgets/cst_search_delegate/cst_search_delegate.dart';
import 'package:kelechek/presentation/home_search/view/home_search_delegate.dart';
import 'package:kelechek/presentation/hunting_farm/hunting_farms_screen.dart';
import 'package:kelechek/presentation/kindergardens/kindergardens_screen.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/rent_office_premises/rent_office_premises_page.dart';
import 'package:kelechek/presentation/rental_home/rental_home_screen.dart';
import 'package:kelechek/presentation/rental_home_with_service/rental_home_with_service_screen.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({required this.rental, super.key});

  final RentalOption rental;

  static Route<void> route(RentalOption rentalOption) {
    return MaterialPageRoute<void>(
      builder: (_) => MainAppScreen(
        rental: rentalOption,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final index = context.select((MainAppCubit cubit) => cubit.state.index);
    final cubit = context.read<MainAppCubit>();
    final orders = getIt<HiveService>().getOrders();
    final user = getIt<HiveService>().getUser;

    Widget currentScreen;
    switch (rental.type) {
      case RentalType.kyal:
        currentScreen = OfficePremisesHomeScreen(
          rentalOption: rental,
        );
      case RentalType.vzmore:
        currentScreen = RentalHomeSceen(
          rentalOption: rental,
        );
      case RentalType.vityaz:
        currentScreen = RentalHomeWithServiceScreen(
          rentalOption: rental,
        );
      case RentalType.yasli:
        currentScreen = KinderGardensScreen(
          rentalOption: rental,
        );
      case RentalType.oxotni:
        currentScreen = HuntingFarmsScreen(
          rentalOption: rental,
        );
    }

    return Scaffold(
      body: index == 0
          ? currentScreen
          : index == 2
              ? const HomeChatScreen()
              : index == 3
                  ? const HomeCartScreen()
                  : const SizedBox(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SafeArea(
        child: Container(
          height: 64.h,
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                padding: const EdgeInsets.all(4),
                icon: CustomImageView(
                  width: 24.w,
                  height: 24.w,
                  imagePath: AppIcon.homeButton,
                  color: index == 0 ? AppColors.selected : AppColors.unselected,
                ),
                onPressed: () {
                  cubit.changeIndex(0);
                },
              ),
              IconButton(
                padding: const EdgeInsets.all(4),
                icon: CustomImageView(
                  width: 24.w,
                  height: 24.w,
                  imagePath: AppIcon.search,
                  color: index == 1 ? AppColors.selected : AppColors.unselected,
                ),
                onPressed: () {
                  // Navigator.push(context, HomeSearchScreen.route());
                  // cubit.changeTap(1);
                  // home search delegate
                  showCustomSearchScreen(
                    context: context,
                    delegate: HomeSearchDelegate(),
                  );
                },
              ),
              IconButton(
                padding: const EdgeInsets.all(4),
                icon: CustomImageView(
                  width: 24.w,
                  height: 24.w,
                  imagePath: AppIcon.chatCircle,
                  color: index == 2 ? AppColors.selected : AppColors.unselected,
                ),
                onPressed: () {
                  cubit.changeIndex(2);
                },
              ),
              IconButton(
                padding: const EdgeInsets.all(4),
                icon: CustomImageView(
                  width: 24.w,
                  height: 24.w,
                  imagePath: AppIcon.shoppingCart,
                  color: index == 3 ? AppColors.selected : AppColors.unselected,
                ),
                onPressed: () {
                  if (orders.isEmpty &&
                      (user == null || user.fulllName.isEmpty)) {
                    context.read<MainAppCubit>().setCurrentPage('cart');
                    Navigator.push(context, HomeCartScreen.route());
                  } else {
                    cubit.changeIndex(3);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
