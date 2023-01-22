import 'package:facebook/global_keys.dart';
import 'package:facebook/provider/common.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsFeedProfileWidget extends StatelessWidget {
  const NewsFeedProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, provider, child) {
      return Container(
        color: Theme.of(context).backgroundColor,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 20,
                    child: ClipOval(
                      child: provider.userProfile != null
                          ? Image.network("${provider.userProfile}")
                          : Text("State is null"),
                    )),
                SizedBox(width: 20),
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                color: Theme.of(context).dividerColor),
                            hintText: "What's on your mind?",
                            border: InputBorder.none))),
              ],
            ),
          ),
          Divider(),
          IntrinsicHeight(
              child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                badgeBuilder(Icons.video_call, "Live"),
                VerticalDivider(),
                badgeBuilder(Icons.image, "Photo"),
                VerticalDivider(),
                badgeBuilder(Icons.chat, "Discuss"),
              ],
            ),
          )),
        ]),
      );
    });
  }

  Widget badgeBuilder(IconData icon, String text) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: Theme.of(GlobalKeys.navigatorKey.currentContext!).dividerColor,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(GlobalKeys.navigatorKey.currentContext!)
                  .dividerColor),
        ),
      ],
    ));
  }
}
