import 'package:flutter/material.dart';

class CustomNumber extends StatelessWidget {
  String? number;
  CustomNumber({super.key, this.number});

  @override
  Widget build(BuildContext context) {
    return Text(
      number!,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}