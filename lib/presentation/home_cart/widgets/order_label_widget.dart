import 'package:flutter/material.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/presentation/home_cart/utils/orders_helpers.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/user_order_model.dart';

class OrderLabelWidget extends StatelessWidget {
  const OrderLabelWidget({
    required this.order,
    super.key,
  });

  final UserOrderModel order;

  @override
  Widget build(BuildContext context) {
    final helper = OrdersHelper(context);
    return Chip(
      avatar: const Icon(
        Icons.access_time_filled_sharp,
        color: AppColors.white,
      ),
      label: Text(
        helper.getStatus(order.status ?? 'new'),
        style: AppTextStyle.s13.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      padding: const EdgeInsets.all(5),
      color: MaterialStateProperty.all(
          helper.getStatusColor(order.status ?? 'new')),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
