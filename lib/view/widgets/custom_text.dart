import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String? text;
  CustomText({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
    );
  }
}