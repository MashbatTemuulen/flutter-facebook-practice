import 'package:facebook/models/newsfeed/index.dart';
import "package:flutter/material.dart";

class NewsFeedCardHeader extends StatelessWidget {
  final NewsFeedModel data;
  const NewsFeedCardHeader(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              child: ClipOval(child: Image.network(data.user.profileImg)),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.user.firstName} ${data.user.lastName}",
                  style: TextStyle(
                      color: Theme.of(context).dividerColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Text(
                      "${data.postDate} *",
                      style: TextStyle(
                          fontSize: 16, color: Theme.of(context).dividerColor),
                    ),
                    Icon(
                        data.postType == "public" ? Icons.public : Icons.person,
                        size: 16,
                        color: Theme.of(context).dividerColor)
                  ],
                )
              ],
            )
          ],
        ),
        Icon(Icons.more_horiz, color: Theme.of(context).dividerColor)
      ],
    );
  }
}
