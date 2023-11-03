import 'package:flutter/material.dart';
import '../../../../common/constants/text_style.dart';


class TextFieldWidgets extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputAction textInputAction;
  final String hintText;
  final TextInputType? textInputType;

  const TextFieldWidgets({
    super.key,
    required this.controller,
    required this.validator,
    required this.textInputAction,
    required this.hintText,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: Colors.white,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: Styles.textStyle,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF313131),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        hintText: hintText,
        hintStyle: Styles.textStyle,
      ),
      obscureText: false,
    );
  }
}
