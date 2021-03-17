import 'package:bmi_app/component/bmi_scaffold.dart';
import 'package:bmi_app/component/bottom_button_widget.dart';
import 'package:bmi_app/component/icon_text_widget.dart';
import 'package:bmi_app/component/increment_decrement_widget.dart';
import 'package:bmi_app/component/reusable_card_widget.dart';
import 'package:bmi_app/component/round_icon_button.dart';
import 'package:bmi_app/component/text_control_widget.dart';
import 'package:bmi_app/screen/result_screen.dart';
import 'package:bmi_app/util/bmi_calculator.dart';
import 'package:bmi_app/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

enum Gender { Male, Female }

class _InputScreenState extends State<InputScreen> {
  Gender selectedGender;
  double height = 150;
  double weight = 60;
  int age = 25;
  final BMICalculator bmiCalculator = BMICalculator(height: 150, weight: 60);
  @override
  Widget build(BuildContext context) {
    return BMIScaffold(Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: ReusableCardWidget(
                    color: selectedGender == Gender.Male
                        ? kActiveColor
                        : kInactiveColor,
                    child: IconTextWidget(
                        iconData: FontAwesomeIcons.mars, label: 'MALE'),
                    onTapFunction: () {
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                  )),
              Expanded(
                  child: ReusableCardWidget(
                    color: selectedGender == Gender.Female
                        ? kActiveColor
                        : kInactiveColor,
                    child: IconTextWidget(
                        iconData: FontAwesomeIcons.venus, label: 'FEMALE'),
                    onTapFunction: () {
                      setState(() {
                        selectedGender = Gender.Female;
                      });
                    },
                  )),
            ],
          ),
        ),
        Expanded(
            child: ReusableCardWidget(
              child: TextControlWidget(
                  suffix: 'cm',
                  label: 'HEIGHT',
                  number: height,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.red,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        trackHeight: 1,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 15)),
                    child: Slider(
                      min: 100,
                      max: 250,
                      value: height,
                      onChanged: (double value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  )),
            )),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReusableCardWidget(
                  child: TextControlWidget(
                    number: weight,
                    label: 'WEIGHT',
                    suffix: 'kg',
                    child: IncrementDecrementWidget(
                        incrementButton: RoundIconButton(
                          iconData: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        decrementButton: RoundIconButton(
                          iconData: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        )),
                  ),
                ),
              ),
              Expanded(
                child: ReusableCardWidget(
                  child: TextControlWidget(
                    number: age.toDouble(),
                    label: 'AGE',
                    child: IncrementDecrementWidget(
                      incrementButton: RoundIconButton(
                        iconData: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                      decrementButton: RoundIconButton(
                        iconData: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomButtonWidget(
          onTop: () {
            bmiCalculator.height = height;
            bmiCalculator.weight = weight;
            bmiCalculator.age = age;
            bmiCalculator.gender = selectedGender;
            ResultScreen resultScreen = ResultScreen(bmiCalculator.calculate());
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => resultScreen));
          },
          buttonLabel: 'Calculate',
        )
      ],
    ));
  }
}