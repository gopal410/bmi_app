import 'package:flutter/material.dart';

import '../util/constants.dart';

class BottomButtonWidget extends StatelessWidget {
  final Function onTop;
  final String buttonLabel;
  const BottomButtonWidget({this.buttonLabel, this.onTop});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child: Container(
        color: Color(0xFFEB1555),
        padding: EdgeInsets.only(bottom: 5),
        margin: EdgeInsets.only(top: 10),
        height: 80,
        child: Center(
            child: Text(
              buttonLabel,
              style: kBottomLabelTextStyle,
            )),
      ),
    );
  }
}