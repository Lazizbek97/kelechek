import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kelechek/core/common/widgets/cst_chip_widget.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/common/widgets/sct_loading_overlay.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/cubit/home_cart_cubit.dart';
import 'package:kelechek/presentation/home_cart/utils/orders_helpers.dart';
import 'package:kelechek/presentation/home_cart/view/order_details_screen.dart';
import 'package:kelechek/presentation/home_cart/widgets/order_widget.dart';

class AllOrdersScreen extends StatefulWidget {
  const AllOrdersScreen({super.key});

  @override
  State<AllOrdersScreen> createState() => _AllOrdersScreenState();
}

class _AllOrdersScreenState extends State<AllOrdersScreen> {
  late OrdersHelper ordersHelper;
  @override
  void initState() {
    ordersHelper = OrdersHelper(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return Scaffold(
      body: BlocBuilder<HomeCartCubit, HomeCartState>(
        builder: (context, state) {
          final cubit = context.read<HomeCartCubit>();
          return CstLoadingOverlay(
            isLoading: state.isLoading,
            child: Column(
              children: [
                Container(
                  color: AppColors.white,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CstChipWidget(
                          onSelected: (bool) {
                            cubit.selectOrderStatus(OrderStatus.all);
                          },
                          isSelected: state.orderStatus == OrderStatus.all,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 5.h,
                          ),
                          label: l10.order_status_all,
                          borderColor: AppColors.primaryColor,
                          bgColor: AppColors.primaryColor,
                        ),
                        const SizedBox(width: 10),
                        for (final type in ordersHelper.getOrderStates())
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: CstChipWidget(
                              onSelected: (bool) {
                                cubit.selectOrderStatus(type.status);
                              },
                              isSelected: state.orderStatus == type.status,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 5.h,
                              ),
                              label: type.title,
                              borderColor: AppColors.primaryColor,
                              bgColor: AppColors.primaryColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: state.orders.isEmpty
                      ? const Center(
                          child: CustomImageView(
                            imagePath: AppImagePaths.emptyContent,
                          ),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) => OrderWidget(
                            order: state.orders[index],
                            onTap: () {
                              Navigator.push(
                                context,
                                OrderDetailsScreen.route(state.orders[index]),
                              );
                            },
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          itemCount: state.orders.length,
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
