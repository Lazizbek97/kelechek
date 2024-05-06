//order statuses
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/l10n/l10n.dart';

class OrdersHelper {
  OrdersHelper(this.context);
  final BuildContext context;

  String getStatus(String status) {
    switch (status) {
      case 'new':
        return context.l10n.order_status_new;
      case 'in_progress':
        return context.l10n.order_status_in_progress;
      case 'completed':
        return context.l10n.order_status_completed;
      case 'canceled':
        return context.l10n.order_status_canceled;
      default:
        return 'canceled';
    }
  }

  List<OrderStates> getOrderStates() {
    return [
      OrderStates(
        'new',
        context.l10n.order_status_new,
        status: OrderStatus.newOrder,
      ),
      OrderStates(
        'in_progress',
        context.l10n.order_status_in_progress,
        status: OrderStatus.inProgress,
      ),
      OrderStates(
        'completed',
        context.l10n.order_status_completed,
        status: OrderStatus.completed,
      ),
      OrderStates(
        'canceled',
        context.l10n.order_status_canceled,
        status: OrderStatus.canceled,
      ),
    ];
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'new':
        return AppColors.lightGray;
      case 'in_progress':
        return AppColors.yellow;
      case 'completed':
        return AppColors.green;
      case 'canceled':
        return AppColors.red;
      default:
        return AppColors.lightGray;
    }
  }

  OrderStatus getStatusTitle(String id) {
    switch (id) {
      case 'new':
        return OrderStatus.newOrder;
      case 'in_progress':
        return OrderStatus.inProgress;
      case 'completed':
        return OrderStatus.completed;
      case 'canceled':
        return OrderStatus.canceled;
      default:
        return OrderStatus.all;
    }
  }
}

class OrderStates {
  OrderStates(this.id, this.title, {required this.status});
  final String id;
  final String title;
  final OrderStatus status;
}

enum OrderStatus {
  newOrder,
  inProgress,
  completed,
  canceled,
  all,
}
