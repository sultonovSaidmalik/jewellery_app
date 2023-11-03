import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF202020),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child:  Center(
        child: Text(
          context.l10n.addToBasket,
          textAlign: TextAlign.center,
          style: Styles.w800_17,
        ),
      ),
    );
  }
}