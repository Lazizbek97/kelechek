import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_icon_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/core/utils/aminity_options.dart';
import 'package:kelechek/core/utils/contacts_options.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/home_chat/cubit/home_chat_cubit.dart';
import 'package:kelechek/presentation/home_chat/view/online_chat_screen.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/map/map_widget.dart';
import 'package:kelechek/presentation/map/service/location_service.dart';
import 'package:kelechek/presentation/rent_office_premises/widgets/office_range_calendar.dart';
import 'package:kelechek/presentation/rental_home/domain/models/rental_homes_list.dart';
import 'package:kelechek/presentation/user_indentification/view/current_order_details_screen.dart';
import 'package:kelechek/presentation/user_indentification/view/user_passport_and_id_selection_screen.dart';

import '../../../core/common/widgets/cst_guest_filter.dart';

class RentalHomeDetailsScreen extends StatefulWidget {
  const RentalHomeDetailsScreen({required this.rentalHousesMd, super.key});

  final RentalHousesMd rentalHousesMd;

  static Route<void> route({required RentalHousesMd rentalHousesMd}) {
    return MaterialPageRoute<void>(
      builder: (_) => RentalHomeDetailsScreen(
        rentalHousesMd: rentalHousesMd,
      ),
    );
  }

  @override
  State<RentalHomeDetailsScreen> createState() =>
      _RentalHomeDetailsScreenState();
}

class _RentalHomeDetailsScreenState extends State<RentalHomeDetailsScreen> {
  int imageIndex = 0;
  String day1 = DateTime.now().formatInLocaleStyle('dd MMM').toString();
  String day2 = DateTime.now()
      .add(Duration(days: 1))
      .formatInLocaleStyle('dd MMM')
      .toString();
  int num1 = 0;
  int num2 = 0;
  int num3 = 0;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: true,
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: CustomImageView(
                    imagePath: AppIcon.arrowBack,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  PageView(
                    onPageChanged: (value) {
                      setState(() {
                        imageIndex = value;
                      });
                    },
                    children: [
                      ...widget.rentalHousesMd.images?.map(
                            (image) => CustomImageView(
                              imagePath: image,
                            ),
                          ) ??
                          [],
                    ],
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Text(
                        '${imageIndex + 1}/${widget.rentalHousesMd.images?.length}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.blueGray,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.5,
                        ),
                        child: Text(
                          widget.rentalHousesMd.name ?? '',
                          style: AppTextStyle.s23,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Wrap(
                          runSpacing: 10,
                          alignment: WrapAlignment.end,
                          children: [
                            ...List.generate(
                              widget.rentalHousesMd.contact?.length ?? 0,
                              (index) => Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CstIconButton(
                                  onPressed: () {
                                    if (widget.rentalHousesMd.contact?[index]
                                            .type ==
                                        'chat') {
                                      context
                                          .read<HomeChatCubit>()
                                          .fetchMessages(
                                            context.l10n.initial_message,
                                            chatId:
                                                widget.rentalHousesMd.name ??
                                                    '',
                                          );

                                      Navigator.push(
                                        context,
                                        OnlineChatScreen.route(),
                                      );
                                    }
                                  },
                                  imagePath: contactOptions[widget
                                              .rentalHousesMd
                                              .contact![index]
                                              .type ??
                                          '']
                                      ?.iconPath,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.rentalHousesMd.roomType ?? '',
                    style: AppTextStyle.s16W400,
                  ),
                ),
                const SizedBox(height: 20),
                _ListContent(
                  text: widget.rentalHousesMd.roomSizeName ?? '',
                  iconPath: AppIcon.homeHashtag,
                ),
                const SizedBox(height: 10),
                _ListContent(
                  text: widget.rentalHousesMd.address?.name ?? '',
                  iconPath: AppIcon.locationMark,
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              l10n.check_in,
                              style: AppTextStyle.s19,
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              child: Text(
                                day1,
                                style: AppTextStyle.s16.copyWith(
                                  color: AppColors.lightBlue,
                                ),
                              ),
                              onTap: () async {
                                await showDialog(
                                  useSafeArea: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      insetPadding: EdgeInsets.zero,
                                      contentPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.white,
                                      content: RangeCalendarWidget(),
                                    );
                                  },
                                ).then(
                                  (value) {
                                    if (value != null && value.isNotEmpty) {
                                      setState(() {
                                        DateTime time = value.first as DateTime;
                                        DateTime time2 = value.last as DateTime;
                                        day1 = time
                                            .formatInLocaleStyle('dd MMM')
                                            .toString();
                                        day2 = time2
                                            .formatInLocaleStyle('dd MMM')
                                            .toString();
                                      });
                                    }
                                  },
                                );
                                //    showModalBottomSheet<void>(
                                //   context: context,
                                //   backgroundColor: Colors.white,
                                //   isScrollControlled: true,
                                //   builder: (BuildContext context) {
                                //     return RangeCalendarWidget();
                                //   },
                                // );
                              },
                            ),
                            const SizedBox(height: 10),
                            const Divider(
                              height: 0,
                              color: AppColors.lightGray,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 50),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              l10n.check_out,
                              style: AppTextStyle.s19,
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              child: Text(
                                day2,
                                style: AppTextStyle.s16.copyWith(
                                  color: AppColors.lightBlue,
                                ),
                              ),
                              onTap: () async {
                                await showDialog(
                                  useSafeArea: false,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      insetPadding: EdgeInsets.zero,
                                      contentPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.white,
                                      content: RangeCalendarWidget(),
                                    );
                                  },
                                ).then(
                                  (value) {
                                    if (value != null && value.isNotEmpty) {
                                      setState(() {
                                        DateTime time = value.first as DateTime;
                                        DateTime time2 = value.last as DateTime;
                                        day1 = time
                                            .formatInLocaleStyle('dd MMM')
                                            .toString();
                                        day2 = time2
                                            .formatInLocaleStyle('dd MMM')
                                            .toString();
                                      });
                                    }
                                  },
                                );
                                //    showModalBottomSheet<void>(
                                //   context: context,
                                //   backgroundColor: Colors.white,
                                //   isScrollControlled: true,
                                //   builder: (BuildContext context) {
                                //     return RangeCalendarWidget();
                                //   },
                                // );
                              },
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(
                              // width: 50,
                              child: Divider(
                                height: 0,
                                color: AppColors.lightGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    l10n.number_of_guests,
                    style: AppTextStyle.s19,
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () async {
                      // showModalBottomSheet<void>(
                      //   context: context,
                      //   backgroundColor: Colors.white,
                      //   isScrollControlled: true,
                      //   builder: (BuildContext context) {
                      //     return QuantityFilter();
                      //   },
                      // );
                      await showDialog(
                        useSafeArea: false,
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            insetPadding: EdgeInsets.zero,
                            contentPadding: EdgeInsets.zero,
                            content: QuantityFilter(),
                          );
                        },
                      ).then((value) {
                        if (value != null && value.isNotEmpty) {
                          List<int> data = value as List<int>;
                          setState(() {
                            num1 = data[0];
                            num2 = data[1];
                            num3 = data[2];
                          });
                        }
                      });
                      ;
                    },
                    child: Text(
                      '${num1} ${l10n.number.toLowerCase()} / ${num2} ${l10n.adults} / ${num3} ${l10n.kids}',
                      style: AppTextStyle.s16.copyWith(
                        color: AppColors.lightBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    l10n.disrepair,
                    style: AppTextStyle.s19,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 5,
                  runSpacing: 10,
                  children: [
                    ...widget.rentalHousesMd.amenities?.map(
                          (amenity) => _ListContent(
                            isAminty: true,
                            text: aminityOptions(context)[amenity.id ?? '']
                                    ?.text ??
                                '',
                            iconPath: aminityOptions(context)[amenity.id ?? '']
                                    ?.iconPath ??
                                '',
                            color: AppColors.primaryColor,
                            textStyle: AppTextStyle.s16W400,
                          ),
                        ) ??
                        [],
                  ],
                ),
                const SizedBox(height: 10),
                MapWidget(location: StatesLocation()),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    l10n.description,
                    style: AppTextStyle.s19,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.rentalHousesMd.description ?? '',
                    style: AppTextStyle.s16W400.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: AppColors.white,
        padding: EdgeInsets.all(16.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '45 000 KGS',
                  style: AppTextStyle.s19W400.copyWith(
                    color: AppColors.darkBlue,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.5,
                  ),
                  child: Text(
                    l10n.disrepair,
                    style: AppTextStyle.s13.copyWith(
                      color: AppColors.silverGray,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 166.w,
              child: CstButton(
                text: l10n.booking,
                onPressed: () {
                  onRent(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onRent(BuildContext context) async {
    final hiveService = getIt<HiveService>();
    final userName = hiveService.getUser?.fulllName;
    final order = OrdersModel(
      productName: widget.rentalHousesMd.name ?? '',
      productInfo: widget.rentalHousesMd.description ?? '',
      size: widget.rentalHousesMd.roomSizeName ?? '',
      price: widget.rentalHousesMd.price ?? 0,
      rentalPeriodFromDate: DateTime.now().formatInStyle('dd/MM/yyyy'),
      rentalPeriodToDate: DateTime.now()
          .add(const Duration(days: 30))
          .formatInStyle('dd/MM/yyyy'),
      address: widget.rentalHousesMd.address?.name ?? '',
      date: DateTime.now().formatInStyle('dd/MM/yyyy HH:mm'),
    );
    if (userName == null || userName.isEmpty) {
      context.read<MainAppCubit>().setCurrentOrder(order);

      await Navigator.push(
        context,
        UserPassportIdSelectionScreen.route(),
      );
    } else {
      context.read<MainAppCubit>().setCurrentOrder(order);
      await Navigator.push(
        context,
        CurrentOrderDetailsScreen.route(order, true),
      );
    }
  }
}

class _ListContent extends StatelessWidget {
  const _ListContent({
    required this.iconPath,
    required this.text,
    super.key,
    this.color,
    this.textStyle,
    this.isAminty = false,
  });
  final String iconPath;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final bool isAminty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: iconPath,
            width: 24,
            height: 24,
            color: color,
          ),
          const SizedBox(width: 10),
          if (isAminty)
            Text(
              text,
              style: textStyle ??
                  AppTextStyle.s19W400.copyWith(
                    color: AppColors.darkBlue,
                  ),
            )
          else
            Expanded(
              child: Text(
                text,
                style: textStyle ??
                    AppTextStyle.s19W400.copyWith(
                      color: AppColors.darkBlue,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
