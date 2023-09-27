import 'package:flutter/material.dart';

import '../../../common/constants/text_style.dart';
import 'confirm_cart_button_wiget.dart';
class BottomTotalPrice extends StatelessWidget {
  const BottomTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: Styles.w400,
              ),
              Text(
                  '10.750 ₺',
                  style: Styles.w700
              )
            ],
          ),
          /// Confirm Cart Button
          ConfirmCartButton(onTap: (){},),
        ],
      ),
    );
  }
}
