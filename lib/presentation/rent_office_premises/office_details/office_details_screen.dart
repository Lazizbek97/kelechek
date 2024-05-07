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
import 'package:kelechek/presentation/rent_office_premises/domain/model/office_premesis_md.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/model/products_list_model.dart';
import 'package:kelechek/presentation/rent_office_premises/domain/repository/office_premesis_repository.dart';
import 'package:kelechek/presentation/user_indentification/view/current_order_details_screen.dart';
import 'package:kelechek/presentation/user_indentification/view/user_passport_and_id_selection_screen.dart';

class OfficePremisesDetailsScreen extends StatefulWidget {
  const OfficePremisesDetailsScreen(
      {required this.kiyal, super.key, required this.productId});

  final ProductsListModel kiyal;
  final int productId;

  static Route<void> route(
    ProductsListModel kiyal,
    int productId,
  ) {
    return MaterialPageRoute<void>(
      builder: (_) => OfficePremisesDetailsScreen(
        kiyal: kiyal,
        productId: productId,
      ),
    );
  }

  @override
  State<OfficePremisesDetailsScreen> createState() =>
      _OfficePremisesDetailsScreenState();
}

class _OfficePremisesDetailsScreenState
    extends State<OfficePremisesDetailsScreen> {
  int imageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final l10 = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            titleSpacing: 0,
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            pinned: true,
            leading: IconButton(
              padding: EdgeInsets.zero,
              icon: CircleAvatar(
                backgroundColor: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: CustomImageView(
                    imagePath: AppIcon.arrowBack,
                    width: 24.w,
                    height: 24.w,
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
                        imageIndex = value + 1;
                      });
                    },
                    children: (OfficePremesisRepository()
                                .getProductImage(widget.kiyal) ??
                            [])
                        .map(
                          (image) => CustomImageView(
                            imagePath: image,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                        .toList(),
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
                        '${imageIndex + 1}/${OfficePremesisRepository().getProductImage(widget.kiyal).length}',
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
                      Text(
                        OfficePremesisRepository()
                                .getProductName(widget.kiyal, l10) ??
                            '',
                        style: AppTextStyle.s23,
                      ),
                      // const Spacer(),
                      // ...List.generate(
                      //   widget.kiyal.contact?.length ?? 0,
                      //   (index) => Padding(
                      //     padding: const EdgeInsets.only(left: 8),
                      //     child: CstIconButton(
                      //       onPressed: () {
                      //         if (widget.kiyal.contact?[index].type == 'chat') {
                      //           context.read<HomeChatCubit>().fetchMessages(
                      //                 context.l10n.initial_message,
                      //                 chatId: widget.kiyal.name ?? '',
                      //               );

                      //           Navigator.push(
                      //             context,
                      //             OnlineChatScreen.route(),
                      //           );
                      //         }
                      //       },
                      //       imagePath: contactOptions[
                      //               widget.kiyal.contact![index].type ?? '']
                      //           ?.iconPath,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                _ListContent(
                  text:
                      "${OfficePremesisRepository().getFlat(widget.kiyal, l10) ?? ''} м²",
                  iconPath: AppIcon.homeHashtag,
                  withIcon: true,
                ),
                const SizedBox(height: 10),
                _ListContent(
                  text: "Beshkek" ?? '',
                  withIcon: true,
                  iconPath: AppIcon.locationMark,
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    l10.description,
                    style: AppTextStyle.s19W400,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    OfficePremesisRepository()
                            .getProductDescription(widget.kiyal, l10) ??
                        '',
                    style: AppTextStyle.s16W400.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    l10.office_features,
                    style: AppTextStyle.s19W400,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  runSpacing: 10,
                  children: [
                    ...List.generate(
                      OfficePremesisRepository()
                          .getConvenince(widget.kiyal, l10)
                          .length,
                      (index) => _ListContent(
                        isAminity: true,
                        text: OfficePremesisRepository()
                                .getConvenince(widget.kiyal, l10)[index] ??
                            '',
                        iconPath: "" ?? '',
                        color: AppColors.primaryColor,
                        textStyle: AppTextStyle.s16W400,
                      ),
                    ),
                    ...List.generate(
                      OfficePremesisRepository()
                          .getfeatures(widget.kiyal, l10)
                          .length,
                      (index) => _ListContent(
                        isAminity: true,
                        text: OfficePremesisRepository()
                                .getfeatures(widget.kiyal, l10)[index] ??
                            '',
                        iconPath: "assets/svg/kitchen.svg" ?? '',
                        color: AppColors.primaryColor,
                        textStyle: AppTextStyle.s16W400,
                      ),
                    ),
                    ...List.generate(
                      OfficePremesisRepository()
                          .getCondition(widget.kiyal, l10)
                          .length,
                      (index) => _ListContent(
                        isAminity: true,
                        text: OfficePremesisRepository()
                                .getCondition(widget.kiyal, l10)[index] ??
                            '',
                        iconPath: "assets/svg/kitchen.svg" ?? '',
                        color: AppColors.primaryColor,
                        textStyle: AppTextStyle.s16W400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                MapWidget(location: StatesLocation()),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10.price,
                    style: AppTextStyle.s16.copyWith(
                      color: AppColors.silverGray,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${OfficePremesisRepository().getPrice(widget.kiyal, l10)} KGS',
                    style: AppTextStyle.s19W400.copyWith(
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 166.w,
              child: CstButton(
                text: l10.rent,
                onPressed: () async {
                  await onRent(widget.kiyal,l10);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onRent(ProductsListModel kiyal,AppLocalizations currentLang) async {
    final hiveService = getIt<HiveService>();
    final userName = hiveService.getUser?.fulllName;
    final order = OrdersModel(
      productName:  OfficePremesisRepository().getProductName(kiyal, currentLang) ?? '',
      productInfo:  OfficePremesisRepository().getProductDescription(kiyal, currentLang) ?? '',
      size: OfficePremesisRepository().getFlat(kiyal, currentLang)?? '',
      price: int.parse(OfficePremesisRepository().getPrice(kiyal, currentLang)??"0") ?? 0,
      rentalPeriodFromDate: DateTime.now().formatInStyle('dd/MM/yyyy'),
      rentalPeriodToDate: DateTime.now()
          .add(const Duration(days: 30))
          .formatInStyle('dd/MM/yyyy'),
      address: "Beshkek" ?? '',
      date: DateTime.now().formatInStyle('dd/MM/yyyy HH:mm'),
      orderNumber: widget.productId,
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
  const _ListContent(
      {required this.iconPath,
      required this.text,
      super.key,
      this.color,
      this.textStyle,
      this.isAminity = false,
      this.withIcon = false});
  final bool withIcon;
  final String iconPath;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final bool isAminity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (withIcon)
            CustomImageView(
              imagePath: iconPath,
              width: 24,
              height: 24,
              color: color,
            ),
          if (withIcon) const SizedBox(width: 10),
          if (isAminity)
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
