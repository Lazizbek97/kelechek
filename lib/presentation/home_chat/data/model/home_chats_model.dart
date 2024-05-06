// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
part 'home_chats_model.g.dart';

@HiveType(typeId: 3)
class HomeChatsModel extends HiveObject {
  HomeChatsModel({
    required this.name,
    required this.imageUrl,
    this.lastMessage = '',
    this.isRead = false,
    this.lastMessageTime = '',
  }) : id = const Uuid().v4();

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final String lastMessage;
  @HiveField(4)
  final bool isRead;
  @HiveField(5)
  final String lastMessageTime;

  HomeChatsModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? lastMessage,
    bool? isRead,
    String? lastMessageTime,
  }) {
    return HomeChatsModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      lastMessage: lastMessage ?? this.lastMessage,
      isRead: isRead ?? this.isRead,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
    );
  }
}
