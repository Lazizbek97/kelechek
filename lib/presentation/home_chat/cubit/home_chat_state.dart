part of 'home_chat_cubit.dart';

class HomeChatState extends Equatable {
  const HomeChatState({
    this.isChatLoading = false,
    this.messages = const [],
    this.chats = const {},
    this.currentChatId = '',
    this.isListening = false,
  });
  final bool isChatLoading;
  final List<types.Message> messages;
  final Map<String, List<types.Message>> chats;
  final String currentChatId;
  final bool isListening;

  HomeChatState copyWith({
    bool? isChatLoading,
    List<types.Message>? messages,
    Map<String, List<types.Message>>? chats,
    String? currentChatId,
    bool? isListening,
  }) {
    return HomeChatState(
      isChatLoading: isChatLoading ?? this.isChatLoading,
      messages: messages ?? this.messages,
      chats: chats ?? this.chats,
      currentChatId: currentChatId ?? this.currentChatId,
      isListening: isListening ?? this.isListening,
    );
  }

  @override
  List<Object?> get props => [
        isChatLoading,
        messages,
        chats,
        currentChatId,
        isListening,
      ];
}
