// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: (json['id'] as num?)?.toInt() ?? -1,
      uid: (json['userId'] as num?)?.toInt() ?? -1,
      title: json['name'] as String? ?? '',
      body: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.uid,
      'name': instance.title,
      'email': instance.body,
    };
