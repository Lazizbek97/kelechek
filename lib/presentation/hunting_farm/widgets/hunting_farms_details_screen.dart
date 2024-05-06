import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/cst_button.dart';
import 'package:kelechek/core/common/widgets/cst_guest_filter.dart';
import 'package:kelechek/core/common/widgets/cst_icon_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/core/extentions/number_helpers.dart';
import 'package:kelechek/core/utils/aminity_options.dart';
import 'package:kelechek/core/utils/contacts_options.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/home_chat/cubit/home_chat_cubit.dart';
import 'package:kelechek/presentation/home_chat/view/online_chat_screen.dart';
import 'package:kelechek/presentation/hunting_farm/domain/models/hunting_rental_list.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/map/map_widget.dart';
import 'package:kelechek/presentation/map/service/location_service.dart';
import 'package:kelechek/presentation/user_indentification/view/current_order_details_screen.dart';
import 'package:kelechek/presentation/user_indentification/view/user_passport_and_id_selection_screen.dart';

import '../../rent_office_premises/widgets/office_range_calendar.dart';

class HuntingFarmDetailsScreen extends StatefulWidget {
  const HuntingFarmDetailsScreen({required this.rentalHuntingMd, super.key});

  final RentalHuntingMd rentalHuntingMd;

  static Route<void> route({
    required RentalHuntingMd rentalHuntingMd,
  }) {
    return MaterialPageRoute<void>(
      builder: (_) => HuntingFarmDetailsScreen(
        rentalHuntingMd: rentalHuntingMd,
      ),
    );
  }

  @override
  State<HuntingFarmDetailsScreen> createState() =>
      _HuntingFarmDetailsScreenState();
}

class _HuntingFarmDetailsScreenState extends State<HuntingFarmDetailsScreen> {
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
                    children: [
                      ...widget.rentalHuntingMd.images?.map(
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
                        '1/${widget.rentalHuntingMd.images?.length}',
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
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: Text(
                          widget.rentalHuntingMd.name ?? '',
                          style: AppTextStyle.s23.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Wrap(
                          runSpacing: 8,
                          alignment: WrapAlignment.end,
                          children: [
                            ...List.generate(
                              widget.rentalHuntingMd.contact?.length ?? 0,
                              (index) => Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CstIconButton(
                                  onPressed: () {
                                    if (widget.rentalHuntingMd.contact?[index]
                                            .type ==
                                        'chat') {
                                      context
                                          .read<HomeChatCubit>()
                                          .fetchMessages(
                                            context.l10n.initial_message,
                                            chatId:
                                                widget.rentalHuntingMd.name ??
                                                    '',
                                          );

                                      Navigator.push(
                                        context,
                                        OnlineChatScreen.route(),
                                      );
                                    }
                                  },
                                  imagePath: contactOptions[widget
                                              .rentalHuntingMd
                                              .contact?[index]
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
                    widget.rentalHuntingMd.roomType ?? '',
                    style: AppTextStyle.s16W400,
                  ),
                ),
                const SizedBox(height: 20),
                _ListContent(
                  text: widget.rentalHuntingMd.roomSize ?? '',
                  iconPath: AppIcon.homeHashtag,
                ),
                const SizedBox(height: 10),
                _ListContent(
                  text: widget.rentalHuntingMd.address?.name ?? '',
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
                      // showModalBottomSheet<void>(
                      //   context: context,
                      //   backgroundColor: Colors.white,
                      //   isScrollControlled: true,
                      //   builder: (BuildContext context) {
                      //     return QuantityFilter();
                      //   },
                      // );
                    },
                    child: Text(
                      '${num1}  ${l10n.number.toLowerCase()} / ${num2} ${l10n.adults} / ${num3} ${l10n.kids}',
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
                    ...widget.rentalHuntingMd.amenities?.map(
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
                    widget.rentalHuntingMd.description ?? '',
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
                  '${AppHelpers.formatNumber(l10n.price.toNum())} KGS',
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
                    l10n.including_taxes_and_fees,
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
      productName: widget.rentalHuntingMd.name ?? '',
      productInfo: widget.rentalHuntingMd.description ?? '',
      size: widget.rentalHuntingMd.roomSize ?? '',
      price: widget.rentalHuntingMd.price ?? 0,
      rentalPeriodFromDate: DateTime.now().formatInStyle('dd/MM/yyyy'),
      rentalPeriodToDate: DateTime.now()
          .add(const Duration(days: 30))
          .formatInStyle('dd/MM/yyyy'),
      address: widget.rentalHuntingMd.address?.name ?? '',
      date: DateTime.now().formatInStyle('dd/MM/yyyy HH:mm'),
    );
    context.read<MainAppCubit>().setCurrentOrder(order);
    if (userName == null || userName.isEmpty) {
      await Navigator.push(
        context,
        UserPassportIdSelectionScreen.route(),
      );
    } else {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: iconPath,
            width: 24,
            height: 24,
            color: color,
          ),
          const SizedBox(width: 10),
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

List<String> contacts = [
  AppIcon.whatsup,
  AppIcon.phone,
  AppIcon.chatCircle,
];
