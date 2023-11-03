import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';

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
      child: Text(
        context.l10n.confirmCart,
        textAlign: TextAlign.center,
        style: Styles.w800,
      ),
    );
  }
}
