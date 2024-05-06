import 'package:flutter/material.dart';
import 'package:kelechek/core/constants/constants.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    required this.onTapBarChange,
    required this.options,
    super.key,
    this.textStyle,
    this.tabController,
    this.borderRadius,
    this.height,
    this.width,
    this.initialIndex = 0,
  });

  final void Function(int index) onTapBarChange;
  final List<String> options;
  final TextStyle? textStyle;
  final TabController? tabController;
  final double? borderRadius;
  final double? height;
  final double? width;
  final int initialIndex;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = widget.tabController ??
        TabController(
          initialIndex: widget.initialIndex,
          length: widget.options.length,
          vsync: this,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 120,
      height: widget.height ?? 56,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 16),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: TabBar(
        controller: _tabController,
        padding: EdgeInsets.zero,
        dividerHeight: 0,
        labelPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: _tabController?.index == 0
                ? const Radius.circular(16)
                : const Radius.circular(0),
            right: _tabController?.index == 1
                ? const Radius.circular(16)
                : const Radius.circular(0),
          ),
          color: AppColors.primaryColor,
          border: Border.all(
            color: AppColors.primaryColor,
          ),
        ),
        unselectedLabelColor: AppColors.blueGray,
        labelStyle: widget.textStyle ??
            AppTextStyle.s16W400.copyWith(
              color: AppColors.white,
            ),
        unselectedLabelStyle: widget.textStyle ??
            AppTextStyle.s16W400.copyWith(
              color: AppColors.white,
            ),
        onTap: (value) {
          widget.onTapBarChange(value);
          setState(() {});
        },
        splashFactory: NoSplash.splashFactory,
        tabs: widget.options
            .map(
              (e) => Tab(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      e,
                      style:
                          widget.textStyle ?? AppTextStyle.s16W400.copyWith(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
