import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResuableIcon extends StatelessWidget {
  ResuableIcon({
    this.label,
    this.icon,
  });
  final String? label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        icon!,
        size: 65,
        color: Colors.white,
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        label!,
        style: labelText,
      )
    ]);
  }
}

class ReusableContainer extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final Function? onPress;

  const ReusableContainer({required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress!();
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: cardChild,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final onPressed;
  final IconData icon;

  const RoundIconButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6,
      onPressed: onPressed,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF212747),
      constraints: const BoxConstraints.tightFor(width: 55, height: 55),
    );
  }
}
