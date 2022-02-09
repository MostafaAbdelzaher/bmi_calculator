import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/resuable.dart';
import 'package:bmi_calculator/screens/resulte_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/constants.dart';
import 'calculator_brain.dart';

class BMICALCULATOR extends StatefulWidget {
  const BMICALCULATOR({Key? key}) : super(key: key);

  @override
  State<BMICALCULATOR> createState() => _BMICALCULATORState();
}

class _BMICALCULATORState extends State<BMICALCULATOR> {
  int height = 60;
  int wight = 60;
  int age = 60;
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C1234),
      appBar: AppBar(
        title: const Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableContainer(
                        onPress: () {
                          setState(() {});
                          selectedGender = Gender.male;
                        },
                        cardChild: ResuableIcon(
                          icon: FontAwesomeIcons.mars,
                          label: "MALE",
                        ),
                        color: selectedGender == Gender.male
                            ? activeCardColor
                            : inActiveCardColor)),
                Expanded(
                    child: ReusableContainer(
                        onPress: () {
                          setState(() {});
                          selectedGender = Gender.female;
                        },
                        cardChild: ResuableIcon(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE",
                        ),
                        color: selectedGender == Gender.female
                            ? activeCardColor
                            : inActiveCardColor)),
              ],
            ),
          ),
          Expanded(
              child: ReusableContainer(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Height",
                  style: labelText,
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "$height",
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      const Text(
                        "cm",
                        style: labelText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x21EB1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 60,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            color: inActiveCardColor,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableContainer(
                  cardChild: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Wight",
                        style: labelText,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        wight.toString(),
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  wight++;
                                });
                              },
                              icon: FontAwesomeIcons.plus,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RoundIconButton(
                              onPressed: () {
                                setState(() {
                                  wight--;
                                });
                              },
                              icon: FontAwesomeIcons.minus,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  color: inActiveCardColor,
                )),
                Expanded(
                  child: ReusableContainer(
                      color: inActiveCardColor,
                      cardChild: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Age",
                            style: labelText,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  icon: FontAwesomeIcons.plus,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                RoundIconButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  icon: FontAwesomeIcons.minus,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(
              onTap: () {
                CalculatorBrain result = CalculatorBrain(
                  height: height,
                  wight: wight,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmiResult: result.calculatorBmi(),
                            resultText: result.getResult(),
                            interpretation: result.getInterpretation(),
                          )),
                );
              },
              text: "CALCULATE")
        ],
      ),
    );
  }
}
