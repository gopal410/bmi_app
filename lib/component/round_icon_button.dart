import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onPressed;
  RoundIconButton({this.iconData, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(iconData),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(width: 50, height: 50),
        fillColor: Color(0xFF4C4F5E),
        onPressed: onPressed);
  }
}