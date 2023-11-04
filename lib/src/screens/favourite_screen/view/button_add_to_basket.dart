import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';

class ButtonAddToBasket extends StatelessWidget {
  final void Function()? onTap;

  const ButtonAddToBasket({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Color(0xFF202020),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.l10n.addToBasket,
            style: Styles.w800_13,
          ),
        ),
      ),
    );
  }
}
