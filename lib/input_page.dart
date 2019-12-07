import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/reusable_card_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerHeight = 70.0;
const activeCardColor = 0xff1d1e33;
const inactiveCardColor = 0xff111328;
const bottomContainerColor = 0xffeb1555;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender = Gender.male;
  void swapGender() {
    gender = gender == Gender.male ? Gender.female : Gender.male;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        swapGender();
                      });
                    },
                    child: ReusableCard(
                      cardColor: Color(gender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor),
                      cardChild: ReusableCardContent(
                        icon: Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        text: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        swapGender();
                      });
                    },
                    child: ReusableCard(
                      cardColor: Color(gender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor),
                      cardChild: ReusableCardContent(
                        icon: Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(cardColor: Color(activeCardColor)),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(cardColor: Color(activeCardColor)),
                ),
                Expanded(
                  child: ReusableCard(cardColor: Color(activeCardColor)),
                ),
              ],
            ),
          ),
          Container(
            color: Color(bottomContainerColor),
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
