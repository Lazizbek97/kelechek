part of 'online_chat_screen.dart';

ChatTheme _chatThem() => DefaultChatTheme(
      inputPadding: EdgeInsets.zero,
      attachmentButtonIcon: SvgPicture.asset(
        AppIcon.paperClip,
        color: AppColors.c858585,
        width: 24,
        height: 24,
      ),
      messageBorderRadius: 10,
      attachmentButtonMargin: EdgeInsets.zero,
      primaryColor: Colors.white,
      inputMargin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
      inputBackgroundColor: Colors.white,
      inputTextColor: AppColors.c858585,
      inputTextDecoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(13, 13, 4, 13),
          child: SvgPicture.asset(
            AppIcon.messageText,
            color: AppColors.c858585,
          ),
        ),
        filled: true,
        fillColor: AppColors.F2F2F3,
        hintText: 'Type a message',
        contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        hintStyle: const TextStyle(
          color: AppColors.c858585,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 0,
          ),
        ),
      ),
      seenIcon: const Text(
        'read',
        style: TextStyle(
          fontSize: 10,
        ),
      ),
    );
