import 'package:flutter/material.dart';

import '../../../common/constants/text_style.dart';
class ScreenNameAndCartButton extends StatelessWidget {
  const ScreenNameAndCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Cart',
            style: Styles.w700_25,
          ),
          /// Button Clear Cart
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 100,
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFF202020),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: const Center(
                child: Text(
                  'Clear Cart',
                  style: Styles.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
