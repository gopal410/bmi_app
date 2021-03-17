import 'package:flutter/material.dart';

import '../util/constants.dart';

class ReusableCardWidget extends StatelessWidget {
  final Widget child;
  final Function onTapFunction;
  final Color color;
  ReusableCardWidget(
      {this.child, this.onTapFunction, this.color = kActiveColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}