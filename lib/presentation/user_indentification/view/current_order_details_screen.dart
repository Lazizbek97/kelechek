import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/number_helpers.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/user_indentification/cubit/user_indentification_cubit.dart';

import 'package:kelechek/presentation/user_indentification/view/rent_contract_screen.dart';

class CurrentOrderDetailsScreen extends StatelessWidget {
  const CurrentOrderDetailsScreen({
    required this.order,
    required this.isFromDetails,
    super.key,
  });

  final OrdersModel order;
  final bool isFromDetails;

  static Route<void> route(OrdersModel order, bool isFromDetails) {
    return MaterialPageRoute<void>(
      builder: (_) => CurrentOrderDetailsScreen(
        order: order,
        isFromDetails: isFromDetails,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = context.select(
      (UserProfileCubit profileCubit) => profileCubit.user,
    );
    return PopScope(
      canPop: isFromDetails,
      onPopInvoked: (didPop) {
        Future.delayed(Duration.zero, () {
          Navigator.pop(context, isFromDetails);
        });
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBackButton(
            onPressed: () {
              Navigator.pop(context, isFromDetails);
            },
          ),
          title: Text(l10n.data_checking),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(height: 20),
                _ContentItemWidget(
                  title: l10n.product,
                  value: order.productName,
                ),
                const SizedBox(height: 16),
                const Divider(),
                _ContentItemWidget(
                  title: l10n.square,
                  value: order.size,
                ),
                const SizedBox(height: 16),
                const Divider(),
                _ContentItemWidget(
                  title: l10n.rental_period,
                  value:
                      '${order.rentalPeriodFromDate} ${l10n.to_date} ${order.rentalPeriodToDate}',
                ),
                const SizedBox(height: 16),
                const Divider(),
                _ContentItemWidget(
                  title: l10n.overall_price,
                  value: '${AppHelpers.formatNumber(order.price)} KGS ',
                ),
                const SizedBox(height: 16),
                const Divider(),
                _ContentItemWidget(
                  title: l10n.address,
                  value: order.address,
                ),
                const SizedBox(height: 16),
                const Divider(),
                _ContentItemWidget(
                  title: l10n.full_name,
                  value: user?.fulllName ?? '',
                ),
                const SizedBox(height: 16),
                const Divider(),
                _ContentItemWidget(
                  title: user?.isForiegner ?? false
                      ? l10n.passport_number
                      : l10n.inn,
                  value: (user?.isForiegner ?? false)
                      ? user?.passportNumber ?? ''
                      : user?.inn ?? '',
                ),
                const SizedBox(height: 16),
                const Divider(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
          child: CstButton(
            text: l10n.continue_text,
            onPressed: () {
              Navigator.push(
                context,
                RentContractScreen.route(
                  order,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ContentItemWidget extends StatelessWidget {
  const _ContentItemWidget({
    required this.title,
    required this.value,
    super.key,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyle.s16W400.copyWith(
            color: AppColors.lightGray,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: AppTextStyle.s16W400.copyWith(
              color: AppColors.blueGray,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
