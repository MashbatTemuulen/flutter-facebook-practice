import 'package:facebook/models/newsfeed/index.dart';
import 'package:facebook/widgets/newsFeed_card_header.dart';
import 'package:facebook/widgets/newsFeed_interact_list.dart';
import "package:flutter/material.dart";

import 'actions.dart';
import 'emotion.dart';
import 'emotion_popup.dart';

class NewsfeedCard extends StatefulWidget {
  final NewsFeedModel data;
  const NewsfeedCard(this.data, {super.key});

  @override
  State<NewsfeedCard> createState() => _NewsfeedCardState();
}

class _NewsfeedCardState extends State<NewsfeedCard> {
  ActionType? type;
  bool showPopup = false;
  void _onPress() {
    setState(() {
      type = type != null ? null : ActionType.like;
    });
  }

  void _onLongPress() {
    setState(() {
      showPopup = true;
    });
  }

  void _onPressActionPopup(ActionType val) {
    setState(() {
      type = val;
      showPopup = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NewsFeedCardHeader(widget.data),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${widget.data.contentDescription}",
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).dividerColor),
                        ),
                      ]),
                ),
                widget.data.contentImage != null
                    ? Image.network(widget.data.contentImage!)
                    : Text(""),
                NewsFeedInteractListWidget(widget.data.interact),
                Divider(
                  height: 1,
                ),
                EmotionWidget(type, _onPress, _onLongPress),
              ],
            )),
        Visibility(
          visible: showPopup,
          child: Transform.translate(
            offset: Offset(0, -50),
            child: EmotionPopUp(_onPressActionPopup),
          ),
        )
      ],
    );
  }
}
