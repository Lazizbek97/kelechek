import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/app_back_button.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/core/extentions/number_helpers.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/widgets/order_label_widget.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/user_order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({required this.order, super.key});

  final UserOrderModel order;

  static Route<void> route(UserOrderModel order) {
    return MaterialPageRoute<void>(
      builder: (_) => OrderDetailsScreen(order: order),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text('${l10n.order} #${order.id}'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: OrderLabelWidget(
                  order: order,
                ),
              ),
              const SizedBox(height: 20),
              _ContentItemWidget(
                title: l10n.product,
                value: order.products?.first.entity?.title ?? '',
              ),
              const SizedBox(height: 16),
              const Divider(),
              _ContentItemWidget(
                title: l10n.square,
                value: "order.size",
              ),
              const SizedBox(height: 16),
              // const Divider(),
              // _ContentItemWidget(
              //   title: l10n.rental_period,
              //   value:
              //       '${order.rentalPeriodFromDate} ${l10n.to_date} ${order.rentalPeriodToDate}',
              // ),
              // const SizedBox(height: 16),
              const Divider(),
              _ContentItemWidget(
                title: l10n.overall_price,
                value:
                    '${AppHelpers.formatNumber(order.price?.toNum() ?? 0)} KGS ',
              ),
              const SizedBox(height: 16),
              const Divider(),
              _ContentItemWidget(
                title: l10n.address,
                value: "order.address",
              ),
              const SizedBox(height: 16),
              const Divider(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
        child: CstButton(
          text: l10n.download_agreement,
          onPressed: () {},
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
