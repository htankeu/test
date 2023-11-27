import 'package:flutter/material.dart';

class LinkText extends StatelessWidget{
  final String outputText;
  final VoidCallback? onTap;
  const LinkText({
    Key? key,
    required this.outputText,
    this.onTap,
    }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      outputText,
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 15
      ),
      );
  }
}