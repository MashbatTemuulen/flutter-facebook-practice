import 'package:facebook/models/story/index.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../provider/common.dart';

class StoryCardWidget extends StatelessWidget {
  final StoryModel data;
  const StoryCardWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Theme.of(context).backgroundColor,
          width: 120,
          height: 200,
          child: Stack(children: [
            Image.network(
              data.coverImg,
              fit: BoxFit.cover,
              width: 120,
              height: 200,
            ),
            Transform.translate(
              offset: Offset(5, 5),
              child: ClipOval(
                child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(3),
                    child: ClipOval(
                      child: Image.network(
                        data.circleImg,
                        fit: BoxFit.cover,
                        height: 30,
                        width: 30,
                      ),
                    )),
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    data.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
