import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserMoodel extends HiveObject {
  UserMoodel({
    this.fulllName = '',
    this.passportNumber = '',
    this.phoneNumber = '',
    this.inn = '',
    this.isForiegner = false,
    this.userBall = 0,
    this.userId = 0,
    this.isVerified = false,
  });

  @HiveField(0)
  String fulllName;

  @HiveField(1)
  String? passportNumber;

  @HiveField(2)
  String phoneNumber;

  @HiveField(3)
  String inn;

  @HiveField(4)
  bool isForiegner;

  @HiveField(5)
  int userBall;

  @HiveField(6)
  int userId;

  @HiveField(7)
  bool isVerified;

  UserMoodel copyWith({
    String? fulllName,
    String? passportNumber,
    String? phoneNumber,
    String? inn,
    bool? isForiegner,
    int? userBall,
    int? userId,
    bool? isVerified,
  }) {
    return UserMoodel(
      fulllName: fulllName ?? this.fulllName,
      passportNumber: passportNumber ?? this.passportNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      inn: inn ?? this.inn,
      isForiegner: isForiegner ?? this.isForiegner,
      userBall: userBall ?? this.userBall,
      userId: userId ?? this.userId,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}
