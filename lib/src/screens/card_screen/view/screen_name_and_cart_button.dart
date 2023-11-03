import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/screens/card_screen/bloc/cart_bloc.dart';

import '../../../common/constants/text_style.dart';
class ScreenNameAndCartButton extends StatelessWidget {
  const ScreenNameAndCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.cart,
            style: Styles.w700_25,
          ),
          /// Button Clear Cart
          GestureDetector(
            onTap: () {
              context.read<CartBloc>().add(const CartClearEvent());
            },
            child: Container(
              width: 100,
              height: 30,
              decoration: const BoxDecoration(
                color: Color(0xFF202020),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Center(
                child: Text(
                  context.l10n.clearCart,
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
