import 'package:flutter/material.dart';

import 'product_count_button.dart';
class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 100,
      height: 35,
      decoration: BoxDecoration(
        color: const Color(0xFF121210),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          width: 1,
          color: const Color(0xFF7D7D7D),
        ),
      ),
      /// Product count button
      child: const ProductCountButton(),
    );
  }
}
