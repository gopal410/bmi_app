import 'package:flutter/material.dart';

import '../util/constants.dart';

class TextControlWidget extends StatelessWidget {
  final Widget child;
  final String label;
  final String suffix;
  final double number;

  TextControlWidget({this.child, this.label, this.suffix = '', this.number});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number.toStringAsFixed(0),
              style: kNumberTextStyle,
            ),
            Text(
              suffix,
              style: kLabelTextStyle,
            ),
          ],
        ),
        child,
      ],
    );
  }
}