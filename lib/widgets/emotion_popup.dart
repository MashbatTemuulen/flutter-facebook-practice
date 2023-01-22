import 'package:facebook/widgets/actions.dart';
import "package:flutter/material.dart";

class EmotionPopUp extends StatelessWidget {
  final void Function(ActionType) onPress;
  const EmotionPopUp(this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.8;
    return Container(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 0),
              blurRadius: 2,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ActionType.values
              .map((e) => InkWell(
                    onTap: () => onPress(e),
                    child: ActionWidget(
                      type: e,
                      size: width / ActionType.values.length - 20,
                    ),
                  ))
              .toList(),
        ));
  }
}
