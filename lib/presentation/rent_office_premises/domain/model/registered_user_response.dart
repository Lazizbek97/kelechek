class RegisteredUserResponse {
  final String? fio;
  final String? identificationCode;
  final int? isVerified;
  final int? id;

  RegisteredUserResponse({
    this.fio,
    this.identificationCode,
    this.isVerified,
    this.id,
  });

  factory RegisteredUserResponse.fromJson(Map<String, dynamic> json) {
    return RegisteredUserResponse(
      fio: json['fio'] as String?,
      identificationCode: json['identification_code'] as String?,
      isVerified: json['is_verified'] as int?,
      id: json['id'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fio': fio,
      'identification_code': identificationCode,
      'is_verified': isVerified,
      'id': id,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisteredUserResponse &&
        other.fio == fio &&
        other.identificationCode == identificationCode &&
        other.isVerified == isVerified &&
        other.id == id;
  }
}
