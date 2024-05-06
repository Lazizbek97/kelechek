// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/app/service_locators.dart';

import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_tapbar.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/number_helpers.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/repository/office_premesis_repository.dart';
import 'package:kelechek/presentation/user_indentification/cubit/user_indentification_cubit.dart';
import 'package:kelechek/presentation/user_indentification/view/payment_success_screen.dart';

class TotalAmountCalculationScreen extends StatefulWidget {
  const TotalAmountCalculationScreen({
    required this.ordersModel,
    super.key,
  });

  final OrdersModel ordersModel;
  static Route<void> route(OrdersModel ordersModel) {
    return MaterialPageRoute<void>(
      builder: (_) => TotalAmountCalculationScreen(
        ordersModel: ordersModel,
      ),
    );
  }

  @override
  State<TotalAmountCalculationScreen> createState() =>
      _TotalAmountCalculationScreenState();
}

class _TotalAmountCalculationScreenState
    extends State<TotalAmountCalculationScreen> {
  bool isMonthly = true;

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    final user = context.select(
      (UserProfileCubit profileCubit) => profileCubit.user,
    );
    final currentOrder = context.select(
      (MainAppCubit cubit) => cubit.state.currentOrder,
    );
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text(l10.points),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            l10.you_have_enough_points_do_you_want_to_use_them,
            style: AppTextStyle.s13.copyWith(
              color: AppColors.lightGray,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Text(
                l10.your_points,
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.blueGray,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  AppHelpers.formatNumber(user?.userBall ?? 0),
                  style: AppTextStyle.s16W400.copyWith(
                    color: AppColors.blueGray,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: AppColors.lightGray,
          ),
          const SizedBox(height: 30),
          CustomTabBar(
            initialIndex: isMonthly ? 0 : 1,
            onTapBarChange: (v) {
              setState(() {
                isMonthly = v == 0;
              });
            },
            options: [
              '${l10.monthly} \n${AppHelpers.formatNumber(widget.ordersModel.price)} KGS ',
              '${l10.yearly} \n${AppHelpers.formatNumber(widget.ordersModel.price * 12)} KGS ',
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                l10.overall_price,
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.blueGray,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${AppHelpers.formatNumber(widget.ordersModel.price)} KGS',
                  style: AppTextStyle.s16W400.copyWith(
                    color: AppColors.blueGray,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: AppColors.lightGray,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
        child: CstButton(
          text: '${l10.pay} ${AppHelpers.formatNumber(
            isMonthly
                ? widget.ordersModel.price
                : widget.ordersModel.price * 12,
          )} KGS',
          onPressed: () async {
            // Navigator.push(context, PaymentScreen.route());
            final ordersCount = getIt<HiveService>().orders.length;
            // getIt<HiveService>().addOrder(
            //   currentOrder!.copyWith(
            //     date: DateTime.now().toString(),
            //     orderType: 'new',
            //     orderNumber: ordersCount + 1,
            //   ),
            // );
            await createOrder(context, currentOrder?.orderNumber ?? 0);
          },
        ),
      ),
    );
  }

  Future<void> createOrder(BuildContext context, int orderiD) async {
    final user = getIt<HiveService>().getUser;
    OfficePremesisRepository officePremesisRepository =
        OfficePremesisRepository();
    final response = await officePremesisRepository.createOrder(
      userId: 11, // user?.userId ?? 0,
      productId: orderiD,
      quantity: 1,
    );
    response.fold(
      (l) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.toString()),
          ),
        );
      },
      (r) {
        Navigator.pushAndRemoveUntil(
          context,
          PaymentSuccessScreen.route(),
          (route) => false,
        );
      },
    );
  }
}
