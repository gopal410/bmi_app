import 'package:bmi_app/component/reusable_card_widget.dart';
import 'package:bmi_app/util/constants.dart';
import 'package:flutter/material.dart';

import '../component/bmi_scaffold.dart';
import '../component/bottom_button_widget.dart';
import '../util/bmi_calculator.dart';

class ResultScreen extends StatelessWidget {
  final BMI bmi;
  ResultScreen(this.bmi);
  @override
  Widget build(BuildContext context) {
    return BMIScaffold(
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                child: Text(
                  'Your BMI Result',
                  style: kResultTextStyle,
                ),
              )),
          Expanded(
              flex: 8,
              child: ReusableCardWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmi.subCategoryLabel.toUpperCase(),
                      style: getSubCategoryTextStyle(bmi.subCategory),
                    ),
                    Text(
                      bmi.bmiLabel,
                      style: kBMITextStyle,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        bmi.comments,
                        style: kCommentsTextStyle,
                      ),
                    ),
                  ],
                ),
              )),
          BottomButtonWidget(
            buttonLabel: 'Re-Calculate',
            onTop: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

TextStyle getSubCategoryTextStyle(SubCategory subCategory) {
  if (subCategory == SubCategory.Normal) {
    return TextStyle(
        color: Colors.green, fontSize: 25, fontWeight: FontWeight.bold);
  }
  if (subCategory == SubCategory.Mild_Thinness ||
      subCategory == SubCategory.Overweight) {
    return TextStyle(
        color: Colors.yellow, fontSize: 25, fontWeight: FontWeight.bold);
  }
  if (subCategory == SubCategory.Moderate_Thinness ||
      subCategory == SubCategory.Obese_Class_I) {
    return TextStyle(
        color: Colors.orange, fontSize: 25, fontWeight: FontWeight.bold);
  }
  if (subCategory == SubCategory.Severe_Thinness ||
      subCategory == SubCategory.Obese_Class_II) {
    return TextStyle(
        color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold);
  }
  return TextStyle(
      color: Colors.red, fontSize: 35, fontWeight: FontWeight.bold);
}