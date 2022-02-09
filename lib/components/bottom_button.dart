import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String text;

  const BottomButton({Key? key, required this.onTap, required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            onTap();
          }),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFEB1555),
      ),
      margin: const EdgeInsetsDirectional.only(top: 10),
      width: double.infinity,
      height: 65,
    );
  }
}
