import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_images.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const AppInfoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.infoAboutApp),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                width: double.infinity,
              ),
              const CustomImageView(
                imagePath: AppImagePaths.appLogo,
              ),
              const SizedBox(height: 20),
              Container(
                // height: 1,
                padding: EdgeInsets.only(bottom: 16.h),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.lightBlue),
                  ),
                ),
                child: Text(
                  'Келечек',
                  style: GoogleFonts.roboto(
                    fontSize: 32,
                    color: const Color(0xff39415A),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              CupertinoButton(
                onPressed: () async {
                  final Uri url = Uri.parse('https://udpgov.fun/#privacy');
                  await launch(url.toString());
                },
                padding: EdgeInsets.zero,
                child: Text(
                  l10n.terms_of_us,
                  style: AppTextStyle.s16W400.copyWith(
                    color: const Color(0xff1573FE),
                  ),
                ),
              ),
              CupertinoButton(
                onPressed: () async {
                  final Uri url = Uri.parse('https://udpgov.fun/#privacy');
                  await launch(url.toString());
                },
                padding: EdgeInsets.zero,
                child: Text(
                  l10n.privacy_and_policy,
                  style: AppTextStyle.s16W400.copyWith(
                    color: const Color(0xff1573FE),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(
                '${l10n.version} 1.0.0',
                style: AppTextStyle.s16W400.copyWith(
                  color: AppColors.lightGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
