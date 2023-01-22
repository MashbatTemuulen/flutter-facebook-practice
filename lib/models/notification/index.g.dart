// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['id'] as int,
      coverImage: json['cover_image'] as String,
      description: (json['description'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdData: json['created_date'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover_image': instance.coverImage,
      'description': instance.description,
      'created_date': instance.createdData,
    };
