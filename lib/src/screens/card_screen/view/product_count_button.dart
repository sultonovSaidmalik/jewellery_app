import 'package:flutter/material.dart';
import '../../../common/constants/text_style.dart';

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
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: decrement,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black),
              child: Center(
                child: Text(
                  count.toString(),
                  style: Styles.w700_16,
                ),
              ),
            ),
            IconButton(
              onPressed: increment,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
