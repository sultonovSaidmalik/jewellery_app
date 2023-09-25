import 'package:flutter/material.dart';

import '../../../common/text_style.dart';
import 'add_to_cart.dart';
class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                /// Uzuk name
                const Text(
                  '2,99 Carat Diamond Ring',
                  style: Styles.w400,
                ),

                /// Icon more
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            /// razmer
            const Text(
              'Boyut: 3.5',
              style: Styles.w300,
            ),
            const SizedBox(height: 15),
             const Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                /// Add To Cart
                AddToCart(),

                /// Price
                Text(
                  '10.750 ₺',
                  textAlign: TextAlign.right,
                  style: Styles.w700_20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
