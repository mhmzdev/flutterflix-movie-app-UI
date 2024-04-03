import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_data.freezed.dart';
part 'auth_data.g.dart';

@freezed
class AuthData with _$AuthData {
  const factory AuthData({
    required String uid,
    required String fullName,
    required String email,
    required DateTime createdAt,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, Object?> json) =>
      _$AuthDataFromJson(json);
}
