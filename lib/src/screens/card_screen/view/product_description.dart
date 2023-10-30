import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';

import '../../../common/constants/text_style.dart';
import 'add_to_cart.dart';

class ProductDescription extends StatelessWidget {
  final String name;
  final String description;
  final num price;
  final int count;
  final void Function() increment;
  final void Function() delete;
  final void Function() decrement;

  const ProductDescription({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
    required this.increment,
    required this.decrement,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Uzuk name
                Text(
                  name,
                  style: Styles.w400,
                ),

                /// Icon more
                GestureDetector(
                  onTap: delete,
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            /// Description
            Text(
              description,
              style: Styles.w300,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Add To Cart
                AddToCart(
                  increment: increment,
                  decrement: decrement,
                  count: count,
                ),
              ],
            ),
            const SizedBox(height: 5),
            /// Price
            Text(
              "$price ${Strings.som.text}",
              textAlign: TextAlign.right,
              style: Styles.w700_20,
            ),
          ],
        ),
      ),
    );
  }
}
