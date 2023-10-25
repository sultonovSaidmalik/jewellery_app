import 'package:flutter/material.dart';

import '../../../common/constants/text_style.dart';

class TextFieldPassword extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputAction textInputAction;
  final String hintText;
  final TextInputType? textInputType;
  final bool obscureText;
  final void Function() onTap;
  final Widget widget;

  const TextFieldPassword({
    super.key,
    required this.controller,
    required this.validator,
    required this.textInputAction,
    required this.hintText,
    this.textInputType, required this.obscureText, required this.onTap, required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      cursorColor: Colors.white,
      textInputAction: textInputAction,
      style: Styles.textStyle,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: widget,
        ),
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
    );
  }
}
