import 'package:facebook/key-value.dart';

import '../../widgets/actions.dart';
import "package:json_annotation/json_annotation.dart";

part 'index.g.dart';

@JsonSerializable()
class InteractModel {
  int like, love, haha, care, wow, angry, sad, comments, shares;

  List<String>? friends;

  InteractModel(
      {required this.like,
      required this.love,
      required this.haha,
      required this.care,
      required this.wow,
      required this.angry,
      required this.sad,
      required this.comments,
      required this.shares});

  int get sumOfInteract => like + love + haha + care + wow + angry + sad;

  List<ActionType> get mostHighActionTypes {
    final List<KeyValueModel> jsonList = [
      KeyValueModel("like", like),
      KeyValueModel("love", love),
      KeyValueModel("haha", haha),
      KeyValueModel("care", care),
      KeyValueModel("wow", wow),
      KeyValueModel("angry", angry),
      KeyValueModel("sad", sad),
    ];

    jsonList.sort((a, b) => b.value - a.value);
    return jsonList
        .sublist(0, 2)
        .map((el) => ActionType.strToActionType(el.key))
        .toList();
  }

  static List<InteractModel> fromList(List<dynamic> data) =>
      data.map((e) => InteractModel.fromJson(e)).toList();
  factory InteractModel.fromJson(Map<String, dynamic> json) =>
      _$InteractModelFromJson(json);
  Map<String, dynamic> toJson() => _$InteractModelToJson(this);
}
