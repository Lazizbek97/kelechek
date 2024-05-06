import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:kelechek/app/service_locators.dart';
import 'package:kelechek/core/extentions/extentions.dart';
import 'package:kelechek/core/utils/hive_service.dart';
import 'package:kelechek/presentation/home_chat/data/model/home_chats_model.dart';
import 'package:record/record.dart';
import 'package:uuid/uuid.dart';

part 'home_chat_state.dart';

class HomeChatCubit extends Cubit<HomeChatState> {
  HomeChatCubit() : super(const HomeChatState());

  final record = AudioRecorder();

  Future<void> fetchMessages(
    String initialMessage, {
    required String chatId,
  }) async {
    emit(
      state.copyWith(
        isChatLoading: true,
        currentChatId: chatId,
      ),
    );
    final messages = state.chats[chatId] ?? [];
    emit(
      state.copyWith(
        messages: messages.isEmpty
            ? [
                types.TextMessage(
                  id: const Uuid().v4(),
                  text: initialMessage,
                  author: const types.User(id: '1'),
                ),
              ]
            : messages,
        isChatLoading: false,
      ),
    );
  }

  Future<void> addMessage(types.Message message) async {
    final messages = List<types.Message>.from([
      message,
      ...state.messages,
    ]);
    final newChats = Map<String, List<types.Message>>.from(state.chats);
    newChats[state.currentChatId] = messages;

    final chats = getIt.get<HiveService>().getHomeChats();

    if (chats.where((element) => element.name == state.currentChatId).isEmpty) {
      await addChat(message);
    }
    emit(
      state.copyWith(
        messages: messages,
        chats: newChats,
      ),
    );
  }

  Future<void> addChat(types.Message message) async {
    await getIt.get<HiveService>().addHomeChat(
          HomeChatsModel(
            name: state.currentChatId,
            imageUrl: '',
            lastMessage: message.type == types.MessageType.text
                ? (message as types.TextMessage).text
                : 'Attachment',
            lastMessageTime: DateTime.now().formatInStyle('hh:mm'),
            isRead: true,
          ),
        );
  }

  Future<void> setlisteningStatus(bool status) async {
    if (status) {
      await _startRecording();
    } else {
      await _stopRecording();
    }
  }

  Future<void> _startRecording() async {
    final path = getIt.get<HiveService>().appDirPath.path;
    // Check and request permission if needed
    if (await record.hasPermission()) {
      emit(
        state.copyWith(
          isListening: true,
        ),
      );
      // Start recording to file
      await record.start(
        const RecordConfig(),
        path: '$path/${const Uuid().v4()}.m4a',
      );
    }
  }

  Future<void> _stopRecording() async {
    emit(
      state.copyWith(
        isListening: false,
      ),
    );
    // Stop recording
    final audioFilePath = await record.stop();

    if (audioFilePath != null) {
      final audioMessage = types.AudioMessage(
        id: const Uuid().v4(),
        author: const types.User(id: '2'),
        duration: const Duration(seconds: 10),
        name: audioFilePath.split('/').last,
        size: 10,
        uri: audioFilePath,
      );
      final curChats = Map<String, List<types.Message>>.from(state.chats);
      curChats[state.currentChatId] = [
        audioMessage,
        ...state.chats[state.currentChatId] ?? [],
      ];
      emit(
        state.copyWith(
          messages: [
            audioMessage,
            ...state.messages,
          ],
          chats: curChats,
        ),
      );
    }
  }
}
