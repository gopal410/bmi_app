import 'dart:math';

import 'package:bmi_app/screen/input_screen.dart';

class BMICalculator {
  Gender gender;
  double height;
  double weight;
  int age;

  BMICalculator({this.gender, this.height, this.weight, this.age});
  BMI calculate() {
    var bmi = weight / pow(height / 100, 2);
    Category category;
    SubCategory subCategory;
    String comments;
    if (bmi < 18.5) {
      category = Category.Underweight;
      comments =
      'You have a lower than normal body weight. You need to eat a bit more and exercise.';
      subCategory = bmi < 16
          ? SubCategory.Severe_Thinness
          : (bmi < 17
          ? SubCategory.Moderate_Thinness
          : SubCategory.Mild_Thinness);
    } else if (bmi <= 25) {
      category = Category.Normal;
      comments =
      'You have a normal body weight. Great job, keep up with your exercises.';
      subCategory = SubCategory.Normal;
    } else if (bmi <= 30) {
      category = Category.Overweight;
      comments =
      'You have a higher than normal body weight. Try to do some exercises to bring the BMI into normal levels (18.5-25).';
      subCategory = SubCategory.Overweight;
    } else {
      category = Category.Obesity;
      comments =
      'You have a very much higher than normal body weight. You need to eat a bit less and exercises more to bring the BMI into normal levels (18.5-25).';
      subCategory = bmi <= 35
          ? SubCategory.Obese_Class_I
          : (bmi <= 40
          ? SubCategory.Obese_Class_II
          : SubCategory.Obese_Class_III);
    }
    return BMI(bmi, category, subCategory, comments);
  }
}

class BMI {
  BMI(this.bmi, this.category, this.subCategory, this.comments);
  final double bmi;
  final Category category;
  final SubCategory subCategory;
  final String comments;
  String get bmiLabel => bmi.toStringAsFixed(1);
  String get categoryLabel => _enumValue(category.toString());
  String get subCategoryLabel => _enumValue(subCategory.toString());
  String _enumValue(String value) =>
      value.substring(value.indexOf('.') + 1).replaceAll('_', ' ');
}

enum Category {
  Underweight,
  Normal,
  Overweight,
  Obesity,
}
enum SubCategory {
  Severe_Thinness,
  Moderate_Thinness,
  Mild_Thinness,
  Normal,
  Overweight,
  Obese_Class_I,
  Obese_Class_II,
  Obese_Class_III
}