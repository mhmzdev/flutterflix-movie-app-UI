// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthDataImpl _$$AuthDataImplFromJson(Map<String, dynamic> json) =>
    _$AuthDataImpl(
      uid: json['uid'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$AuthDataImplToJson(_$AuthDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'fullName': instance.fullName,
      'email': instance.email,
      'createdAt': instance.createdAt.toIso8601String(),
    };
