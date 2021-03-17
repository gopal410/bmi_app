import 'package:flutter/material.dart';

import 'round_icon_button.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final RoundIconButton incrementButton;
  final RoundIconButton decrementButton;
  IncrementDecrementWidget({this.decrementButton, this.incrementButton});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        decrementButton,
        SizedBox(
          width: 10,
        ),
        incrementButton
      ],
    );
  }
}