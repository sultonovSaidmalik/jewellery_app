import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/text_style.dart';
class ButtonAddToBasket extends StatelessWidget {
  final void Function()? onTap;
  const ButtonAddToBasket({super.key , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 35,
        decoration: const BoxDecoration(
          color: Color(0xFF202020),
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child:  const Center(
          child: Text(
            "Add to Basket",
            style: Styles.w800_13,
          ),
        ),
      ),
    );
  }
}
