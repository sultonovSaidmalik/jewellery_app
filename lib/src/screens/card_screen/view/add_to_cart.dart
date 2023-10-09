import 'package:flutter/material.dart';

import 'product_count_button.dart';

class AddToCart extends StatelessWidget {
  final void Function() increment;
  final void Function() decrement;
  final int count;

  const AddToCart({
    super.key,
    required this.increment,
    required this.decrement,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ProductCountButton(
        increment: increment,
        decrement: decrement,
        count: count,
      ),
    );
  }
}
