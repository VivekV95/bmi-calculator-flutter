import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/reusable_card_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onClick: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    cardColor: Color(gender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor),
                    cardChild: ReusableCardContent(
                      icon: Icon(
                        FontAwesomeIcons.mars,
                        size: 80,
                      ),
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onClick: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    cardColor: Color(gender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor),
                    cardChild: ReusableCardContent(
                      icon: Icon(
                        FontAwesomeIcons.venus,
                        size: 80,
                      ),
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: Color(kActiveCardColor),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text('$height', style: kMeasurementTextStyle),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e98),
                        thumbColor: Color(0xffed1555),
                        overlayColor: Color(0x29ed1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinSliderHeight,
                      max: kMaxSliderHeight,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: Color(
                      kActiveCardColor,
                    ),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kMeasurementTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              onClick: () {
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              },
                              iconData: FontAwesomeIcons.minus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              onClick: () {
                                setState(() {
                                  if (weight < 500) weight++;
                                });
                              },
                              iconData: FontAwesomeIcons.plus,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: Color(
                      kActiveCardColor,
                    ),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kMeasurementTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onClick: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              iconData: FontAwesomeIcons.minus,
                              onClick: () {
                                setState(() {
                                  if (age < 120) age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Color(kBottomContainerColor),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData iconData;
  final Function onClick;

  RoundIconButton({this.iconData, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RawMaterialButton(
        child: Icon(iconData),
        onPressed: onClick,
        shape: CircleBorder(),
        fillColor: Color(0x254c4f5e),
        constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56,
        ),
      ),
    );
  }
}
