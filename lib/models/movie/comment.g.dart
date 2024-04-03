// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      uid: json['uid'] as String,
      comment: json['comment'] as String,
      visible: json['visible'] as bool? ?? true,
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'comment': instance.comment,
      'visible': instance.visible,
    };
