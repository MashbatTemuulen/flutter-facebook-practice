import 'package:facebook/global_keys.dart';
import 'package:facebook/models/interact/index.dart';
import 'package:facebook/utils/index.dart';
import 'package:facebook/widgets/actions.dart';
import "package:flutter/material.dart";

class NewsFeedInteractListWidget extends StatelessWidget {
  final InteractModel data;
  const NewsFeedInteractListWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ...List.generate(
                  data.mostHighActionTypes.length,
                  (index) =>
                      ActionWidget(type: data.mostHighActionTypes[index])),
              SizedBox(
                width: 10,
              ),
              Text(
                Utils.thousandify(data.sumOfInteract).toString(),
                style: _style,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "${Utils.thousandify(data.comments).toString()} comments",
                style: _style,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${Utils.thousandify(data.shares).toString()} shares",
                style: _style,
              ),
            ],
          )
        ],
      ),
    );
  }

  TextStyle get _style => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(GlobalKeys.navigatorKey.currentContext!).dividerColor);
}
