import 'package:flutter/material.dart';
import '../../../common/constants/text_style.dart';

class AddToIncDec extends StatelessWidget {
  final void Function() increment;
  final void Function() decrement;
  final int count;

  const AddToIncDec({
    super.key,
    required this.increment,
    required this.decrement,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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

class ProductCountButton extends StatelessWidget {
  final void Function() increment;
  final void Function() decrement;
  final int count;

  const ProductCountButton({
    super.key,
    required this.increment,
    required this.decrement,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            IconButton(
              onPressed: decrement,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 40,
              ),
            ),
            Container(
              height: 26,
              width: 26,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: Center(
                child: Text(
                  count.toString(),
                  style: Styles.w700_16.copyWith(
                      fontSize: 22
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: increment,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 40,

              ),
            ),
          ],
        ),
      ),
    );
  }
}
