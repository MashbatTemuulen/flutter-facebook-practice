// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsFeedModel _$NewsFeedModelFromJson(Map<String, dynamic> json) =>
    NewsFeedModel(
      id: json['id'] as int,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      postDate: json['postDate'] as String,
      postType: json['postType'] as String,
      contentDescription: json['contentDescription'] as String,
      contentImage: json['contentImage'] as String?,
      interact:
          InteractModel.fromJson(json['interact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsFeedModelToJson(NewsFeedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'postDate': instance.postDate,
      'postType': instance.postType,
      'contentDescription': instance.contentDescription,
      'contentImage': instance.contentImage,
      'interact': instance.interact,
    };
