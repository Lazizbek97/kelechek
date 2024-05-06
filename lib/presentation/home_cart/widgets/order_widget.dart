import 'package:flutter/material.dart';
import 'package:kelechek/core/common/widgets/cst_inkwell.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/widgets/order_label_widget.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/user_order_model.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({
    required this.onTap,
    required this.order,
    super.key,
  });
  final VoidCallback onTap;
  final UserOrderModel order;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return CustomInkWell(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      onTapDown: (p0) => setState(() => isTapped = true),
      onTapCancel: () => setState(() => isTapped = false),
      onTapUp: (p0) => setState(() => isTapped = false),
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              OrderLabelWidget(
                order: widget.order,
              ),
              const Spacer(),
              CustomImageView(
                imagePath: AppIcon.x,
                width: 22,
                height: 22,
                color: AppColors.lightGray,
                onTap: () async {
                  // await getIt<HiveService>().deleteOrder(widget.order);
                },
              ),
            ],
          ),
          Text(
            '${l10.order} #${widget.order.id}',
            style: AppTextStyle.s16.copyWith(
              color: isTapped ? AppColors.white : AppColors.darkBlue,
            ),
          ),
          Text(
            widget.order.createdAt!
                .formatCustomDateTime(l10.language.toLowerCase()),
            style: AppTextStyle.s10.copyWith(
              fontWeight: FontWeight.w400,
              color: isTapped ? AppColors.white : AppColors.lightGray,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.order.products?.first.entity?.title ?? '',
            style: AppTextStyle.s10.copyWith(
              fontWeight: FontWeight.w400,
              color: isTapped ? AppColors.white : AppColors.lightGray,
            ),
          ),
        ],
      ),
    );
  }
}
