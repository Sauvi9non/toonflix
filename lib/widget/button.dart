import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String txt;
  final Color bgColor;
  final Color txtColor;

  const Button({
    super.key,
    required this.txt,
    required this.bgColor,
    required this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(45),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 50,
        ),
        child: Text(
          txt,
          style: TextStyle(
            fontSize: 20,
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
