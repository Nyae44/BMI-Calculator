// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors,, prefer_const_constructors_in_immutables, use_full_hex_values_for_flutter_colors
// ignore: prefer_const_literals_to_create_immutables

import 'package:calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusabale_icons.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  //Color maleCardColor = inactiveCardColor;
  //Color femaleCardColor = inactiveCardColor;
  //1= male, 2 = female

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  cardChild: ReusableIcons(
                    icon: FontAwesomeIcons.mars,
                    label: 'Male',
                  ),
                  colour: selectedGender == Gender.male
                      ? kReusableCardColor
                      : kInactiveCardColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (() {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  }),
                  colour: selectedGender == Gender.female
                      ? kReusableCardColor
                      : kInactiveCardColor,
                  cardChild: ReusableIcons(
                    icon: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: ReusableCard(
            onPress: (() {
              null;
            }),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  height.toString(),
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xff8d8e98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: ((double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      })),
                )
              ],
            ),
            colour: kReusableCardColor,
          )),
          Expanded(
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        null;
                      });
                    },
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            RoundIconButton(
                              myPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              myPress: (() {
                                setState(() {
                                  weight--;
                                });
                              }),
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        )
                      ],
                    ),
                    colour: kReusableCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (() {
                      setState(() {
                        null;
                      });
                    }),
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              myPress: (() {
                                setState(() {
                                  age++;
                                });
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              myPress: (() {
                                setState(() {
                                  age--;
                                });
                              }),
                            )
                          ],
                        )
                      ],
                    ),
                    colour: kReusableCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
