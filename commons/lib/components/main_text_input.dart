import 'package:flutter/material.dart';

class MainTextInputWidget extends StatelessWidget {
  final Function onSubmitted;
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  const MainTextInputWidget(
      {super.key,
      required this.onSubmitted,
      required this.hint,
      required this.controller,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onSubmitted: (value) => onSubmitted.call(),
    );
  }
}
