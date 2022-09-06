import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.controller,
    required this.inputType,
    this.isObscure = false,
    required this.hint,
    this.icon,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final bool isObscure;
  final String hint;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      obscureText: isObscure,
      cursorColor: kAmber,
      style: kBodyRegular,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        isDense: true,
        fillColor: kGreyWhite,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            color: kAmber,
            width: 2.0,
          ),
        ),
        hintText: hint,
        hintStyle: kBodyRegularHint,
      ),
    );
  }
}
