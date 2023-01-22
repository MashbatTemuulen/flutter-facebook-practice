import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../provider/common.dart';

class StoryCreateWidget extends StatelessWidget {
  const StoryCreateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: (context, value, child) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Theme.of(context).backgroundColor,
            width: 120,
            height: 200,
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  value.userProfile != null
                      ? SizedBox(
                          height: 120,
                          child: Image.network(
                            value.userProfile.toString(),
                            fit: BoxFit.cover,
                          ))
                      : Text("Null Profile"),
                  Text(
                    "Create a story",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).dividerColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  SizedBox()
                ],
              ),
              Align(
                child: Transform.translate(
                  offset: Offset(0, 20),
                  child: ClipOval(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      padding: EdgeInsets.all(3),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      );
    });
  }
}
