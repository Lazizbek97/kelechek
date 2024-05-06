import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/cst_icon_button.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/core/utils/contacts_options.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_cart/data/order/orders_model.dart';
import 'package:kelechek/presentation/home_chat/cubit/home_chat_cubit.dart';
import 'package:kelechek/presentation/home_chat/view/online_chat_screen.dart';

import 'package:kelechek/presentation/kindergardens/domain/models/kindergarden_list_md.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';
import 'package:kelechek/presentation/user_indentification/view/current_order_details_screen.dart';
import 'package:kelechek/presentation/user_indentification/view/user_passport_and_id_selection_screen.dart';

import '../../map/map_widget.dart';
import '../../map/service/location_service.dart';

class KinderGardenDetailsScreen extends StatefulWidget {
  const KinderGardenDetailsScreen({required this.kindergardenMd, super.key});

  final KindergardenMd kindergardenMd;

  static Route<void> route({
    required KindergardenMd kindergardenMd,
  }) {
    return MaterialPageRoute<void>(
      builder: (_) => KinderGardenDetailsScreen(
        kindergardenMd: kindergardenMd,
      ),
    );
  }

  @override
  State<KinderGardenDetailsScreen> createState() =>
      _KinderGardenDetailsScreenState();
}

class _KinderGardenDetailsScreenState extends State<KinderGardenDetailsScreen> {
  int groupCount = 0;

  @override
  void initState() {
    widget.kindergardenMd.groups?.forEach((key, value) {
      groupCount += int.parse(value.toString());
    });
    super.initState();
  }

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
                      ...widget.kindergardenMd.images?.map(
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
                        '1/${widget.kindergardenMd.images?.length}',
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
                          maxWidth: MediaQuery.of(context).size.width * 0.4,
                        ),
                        child: Text(
                          widget.kindergardenMd.name ?? '',
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
                              widget.kindergardenMd.contact?.length ?? 0,
                              (index) => Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CstIconButton(
                                  onPressed: () {
                                    if (widget.kindergardenMd.contact?[index]
                                            .type ==
                                        'chat') {
                                      context
                                          .read<HomeChatCubit>()
                                          .fetchMessages(
                                            context.l10n.initial_message,
                                            chatId:
                                                widget.kindergardenMd.name ??
                                                    '',
                                          );

                                      Navigator.push(
                                        context,
                                        OnlineChatScreen.route(),
                                      );
                                    }
                                  },
                                  imagePath: contactOptions[widget
                                              .kindergardenMd
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
                const SizedBox(height: 16),
                _ListContent(
                  text: '$groupCount ${l10n.available_groups}',
                  iconPath: AppIcon.pedestrian,
                ),
                const SizedBox(height: 10),
                _ListContent(
                  text: widget.kindergardenMd.address ?? '',
                  iconPath: AppIcon.locationMark,
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () => onRent(context),
                  child: Container(
                    height: 83,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: AppColors.lightBlue,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.payment_to_education,
                            style: AppTextStyle.s19W400
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CustomImageView(
                          imagePath: AppImagePaths.educationIllustr,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                MapWidget(
                  location: AppLatLong(
                    lat: widget.kindergardenMd.location!.latitude ??
                        StatesLocation().lat,
                    long: widget.kindergardenMd.location!.longitude ??
                        StatesLocation().long,
                  ),
                ),
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
                    widget.kindergardenMd.description ?? '',
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
    );
  }

  Future<void> onRent(BuildContext context) async {
    final l10n = context.l10n;
    final hiveService = getIt<HiveService>();
    final userName = hiveService.getUser?.fulllName;
    final order = OrdersModel(
      productName: widget.kindergardenMd.name ?? '',
      productInfo: widget.kindergardenMd.description ?? '',
      size: '$groupCount  ${l10n.available_groups}',
      price: widget.kindergardenMd.price ?? 0,
      rentalPeriodFromDate: DateTime.now().formatInStyle('dd/MM/yyyy'),
      rentalPeriodToDate: DateTime.now()
          .add(const Duration(days: 30))
          .formatInStyle('dd/MM/yyyy'),
      address: widget.kindergardenMd.address ?? '',
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
