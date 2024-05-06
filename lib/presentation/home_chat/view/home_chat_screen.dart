import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/constants.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/l10n/l10n.dart';
import 'package:kelechek/presentation/home_chat/cubit/home_chat_cubit.dart';
import 'package:kelechek/presentation/home_chat/view/online_chat_screen.dart';
import 'package:kelechek/presentation/main_app/cubit/main_app_cubit.dart';

class HomeChatScreen extends StatefulWidget {
  const HomeChatScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const HomeChatScreen(),
    );
  }

  @override
  State<HomeChatScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<HomeChatScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final rental =
        context.select((MainAppCubit cubit) => cubit.state.rentalOption);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const CustomImageView(
            imagePath: AppIcon.arrowBack,
          ),
          onPressed: () {
            context.read<MainAppCubit>().changeIndex(0);
          },
        ),
        title: Text(rental?.title ?? ''),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 36,
              child: TextFormField(
                controller: searchController,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  hintText: l10n.search,
                  hintStyle: AppTextStyle.s17W400.copyWith(
                    color: AppColors.gray4,
                  ),
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(13, 6, 13, 6),
                    child: SvgPicture.asset(
                      AppIcon.search,
                      color: AppColors.gray5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: getIt<HiveService>().homeChatsBox,
              builder: (context, chats, child) {
                final homeChats = chats.values.toList();
                if (searchController.text.isNotEmpty) {
                  homeChats.removeWhere(
                    (element) => !element.name.toLowerCase().contains(
                          searchController.text.toLowerCase(),
                        ),
                  );
                }
                return ListView.separated(
                  itemCount: homeChats.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        context.read<HomeChatCubit>().fetchMessages(
                              l10n.initial_message,
                              chatId: homeChats[index].name,
                            );
                        Navigator.push(context, OnlineChatScreen.route());
                      },
                      title: Text(
                        homeChats[index].name,
                        style: AppTextStyle.s19.copyWith(
                          color: AppColors.darkBlue,
                        ),
                      ),
                      subtitle: Text(
                        homeChats[index].lastMessage,
                        style: AppTextStyle.s16W400.copyWith(
                          color: AppColors.lightGray,
                        ),
                      ),
                      leading: homeChats[index].imageUrl.isNotEmpty
                          ? CustomImageView(
                              imagePath: homeChats[index].imageUrl,
                            )
                          : CircleAvatar(
                              radius: 26.r,
                              backgroundColor: AppColors.lightBlue,
                              child: Text(
                                homeChats[index].name[0],
                                style: AppTextStyle.s23.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            homeChats[index].lastMessageTime,
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              color: AppColors.lightGray,
                            ),
                          ),
                          if (!homeChats[index].isRead)
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: AppColors.lightBlue,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '1',
                                style: AppTextStyle.s15W400.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            )
                          else
                            const CustomImageView(
                              imagePath: AppIcon.doubleCheck,
                              color: AppColors.lightBlue,
                              height: 20,
                              width: 20,
                            ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
