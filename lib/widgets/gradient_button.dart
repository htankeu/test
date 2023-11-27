import 'package:flutter/material.dart';
import 'package:bookmytime/tools/pallete.dart';

class GradientButton extends StatelessWidget{
  final String text;
  final double buttonHeight;
  final double buttonWidth;
  final void Function()? action;
  const GradientButton({
    Key? key,
    required this.text,
    required this.buttonHeight,
    required this.buttonWidth,
    this.action,
    }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Pallete.gradient1Blue,
            Pallete.gradient2,
            Pallete.gradient3
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
          ),
          borderRadius: BorderRadius.circular(10)
      ),
      child: ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(buttonWidth, buttonHeight),
        backgroundColor: Pallete.transparenceColor1,
        shadowColor: Pallete.transparenceColor1
      ), 
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      )),
    );
  }
}