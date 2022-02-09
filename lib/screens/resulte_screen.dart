import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/resuable.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';

class ResultScreen extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultScreen(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                "Your Result",
                style: titleResultStyle,
              ),
            )),
            Expanded(
                flex: 5,
                child: ReusableContainer(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: const TextStyle(
                            color: Color(0xFF24D876),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmiResult,
                        style: bmiTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  color: activeCardColor,
                )),
            BottomButton(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                text: "RE-CALCULATE"),
          ],
        ));
  }
}
