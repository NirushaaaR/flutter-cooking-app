import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final EdgeInsets padding;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.padding = const EdgeInsets.symmetric(
      vertical: 5,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: TextField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }
}
