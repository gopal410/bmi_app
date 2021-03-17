import 'package:flutter/material.dart';

import '../util/constants.dart';

class IconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String label;

  IconTextWidget({this.iconData, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 60,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}