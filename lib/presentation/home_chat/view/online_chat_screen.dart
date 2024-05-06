import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:kelechek/core/common/widgets/custom_image_view.dart';
import 'package:kelechek/core/constants/app_colors.dart';
import 'package:kelechek/core/constants/app_icons.dart';
import 'package:kelechek/core/constants/app_text_style.dart';
import 'package:kelechek/core/utils/image_picker_service.dart';
import 'package:kelechek/presentation/home_chat/cubit/home_chat_cubit.dart';
import 'package:lottie/lottie.dart';
import 'package:uuid/uuid.dart';
import 'package:voice_message_package/voice_message_package.dart';

part 'online_chat_theme.dart';

class OnlineChatScreen extends StatefulWidget {
  const OnlineChatScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const OnlineChatScreen(),
    );
  }

  @override
  State<OnlineChatScreen> createState() => _OnlineChatScreenState();
}

class _OnlineChatScreenState extends State<OnlineChatScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    context.read<HomeChatCubit>().setlisteningStatus(false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const CustomImageView(
            imagePath: AppIcon.arrowBack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Online-chat'),
      ),
      body: BlocBuilder<HomeChatCubit, HomeChatState>(
        builder: (context, state) {
          final cubit = context.read<HomeChatCubit>();
          return Theme(
            data: ThemeData.light(),
            child: Chat(
              messages: state.messages,
              onAttachmentPressed: () async {
                await pickImage().then((value) {
                  if (value != null) {
                    cubit.addMessage(
                      types.ImageMessage(
                        author: const types.User(id: '2'),
                        id: const Uuid().v4(),
                        name: '',
                        size: 50,
                        uri: value.path,
                      ),
                    );
                  }
                });
              },
              onMessageTap: (context, text) {},
              onPreviewDataFetched: (text, previewData) {},
              onSendPressed: (text) {
                cubit.addMessage(
                  types.TextMessage(
                    id: const Uuid().v4(),
                    text: text.text,
                    author: const types.User(id: '2'),
                    createdAt: DateTime.now().millisecondsSinceEpoch,
                  ),
                );
              },
              showUserNames: true,
              timeFormat: DateFormat.Hm(),
              onMicPressed: () {
                FocusScope.of(context).unfocus();
                cubit.setlisteningStatus(true);
              },
              user: const types.User(id: '2'),
              inputOptions: InputOptions(
                sendButtonVisibilityMode: SendButtonVisibilityMode.always,
                onMicPressed: () {},
              ),
              buttonPadding: const EdgeInsets.symmetric(vertical: 10),
              theme: _chatThem(),
              dateHeaderBuilder: (p0) => Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    DateFormat.Hm().format(
                      p0.dateTime,
                    ),
                    style: const TextStyle(
                      color: AppColors.gray4,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              customBottomWidget: state.isListening
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        // color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.lightGray,
                        ),
                      ),
                      child: SafeArea(
                        child: Row(
                          children: [
                            Expanded(
                              child: Lottie.asset(
                                'assets/lottie/listening.json',
                                height: 50,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.stop),
                              onPressed: () {
                                cubit.setlisteningStatus(false);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : null,
              messageWidthRatio: 0.8,
              audioMessageBuilder: (audioMessage, {required messageWidth}) =>
                  Container(
                decoration: BoxDecoration(
                  color: audioMessage.author.id == '2'
                      ? const Color(0xffEBF2FF)
                      : AppColors.lightGray,
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.lightGray,
                      AppColors.lightGray,
                    ],
                  ),
                ),
                child: VoiceMessageView(
                  backgroundColor: audioMessage.author.id == '2'
                      ? const Color(0xffEBF2FF)
                      : AppColors.lightGray,
                  cornerRadius: 10,
                  controller: VoiceController(
                    audioSrc: audioMessage.uri,
                    maxDuration: const Duration(
                      seconds: 120,
                    ),
                    isFile: true,
                    onComplete: () {},
                    onPause: () {},
                    onPlaying: () {},
                  ),
                ),
              ),
              textMessageBuilder:
                  (p0, {required messageWidth, required showName}) => Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(
                  bottom: 4,
                  left: 1,
                  right: 1,
                ),
                decoration: BoxDecoration(
                  color:
                      p0.author.id == '2' ? AppColors.EBF2FF : AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray4.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Text(
                  p0.text,
                  style: AppTextStyle.s16W400.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
