import 'package:flutter/material.dart';

import '../../../common/constants/text_style.dart';
class ConfirmCartButton extends StatelessWidget {
  final void Function()? onTap;
  const ConfirmCartButton({super.key , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        height: 50,
        decoration: const BoxDecoration(
          color: Color(0xFF202020),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const Center(
          child: Text(
            'Confirm Cart',
            textAlign: TextAlign.center,
            style: Styles.w800,
          ),
        ),
      ),
    );
  }
}
