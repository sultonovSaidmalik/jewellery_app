import 'package:flutter/material.dart';

import '../../../common/constants/text_style.dart';

class ConfirmCartButton extends StatelessWidget {
  final bool isActive;
  final void Function()? onTap;

  const ConfirmCartButton({super.key, required this.onTap, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF202020).withOpacity(isActive ? 1 : 0.4),
        fixedSize: const Size(220, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTap,
      child: const Text(
        'Confirm cart',
        textAlign: TextAlign.center,
        style: Styles.w800,
      ),
    );
  }
}
