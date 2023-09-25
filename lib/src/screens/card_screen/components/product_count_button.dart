import 'package:flutter/material.dart';
import '../../../common/text_style.dart';
class ProductCountButton extends StatelessWidget {
  const ProductCountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 5.0),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.remove,
                color: Colors.grey
                    .withOpacity(0.2),
              ),
            ),
            Container(
              height: 26,
              width: 26,
              decoration:
              const BoxDecoration(
                  shape:
                  BoxShape.circle,
                  color: Colors.black),
              child: const Center(
                child: Text(
                  '1',
                  style: Styles.w700_16,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.add,
                color: Colors.grey
                    .withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
