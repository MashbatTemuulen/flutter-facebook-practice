import 'package:facebook/models/interact/index.dart';
import 'package:facebook/models/user/index.dart';
import "package:json_annotation/json_annotation.dart";

part 'index.g.dart';

@JsonSerializable()
class NewsFeedModel {
  int id;
  UserModel user;
  String postDate, postType, contentDescription;
  String? contentImage;
  InteractModel interact;

  NewsFeedModel(
      {required this.id,
      required this.user,
      required this.postDate,
      required this.postType,
      required this.contentDescription,
      this.contentImage,
      required this.interact});

  static List<NewsFeedModel> fromList(List<dynamic> data) =>
      data.map((e) => NewsFeedModel.fromJson(e)).toList();
  factory NewsFeedModel.fromJson(Map<String, dynamic> json) =>
      _$NewsFeedModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsFeedModelToJson(this);
}
