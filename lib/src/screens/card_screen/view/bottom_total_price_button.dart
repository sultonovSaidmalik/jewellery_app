import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/screens/card_screen/bloc/cart_bloc.dart';
import 'package:jewellery_app/src/screens/card_screen/scop/cart_scope.dart';

import '../../../common/constants/text_style.dart';
import 'confirm_cart_button_wiget.dart';

class BottomTotalPrice extends StatelessWidget {
  const BottomTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.total, style: Styles.w400),
                Text(
                  '${state.cart.items.map((e) => e.totalPrice).fold<num>(0, (total, element) => total += element)} ${context.l10n.som}',
                  style: Styles.w700,
                ),
              ],
            ),

            /// Confirm Cart Button
            ConfirmCartButton(
              onTap: CartScope.of(context)!.onPressOrder,
              isActive: state.cart.items.isNotEmpty,
            ),
          ],
        );
      }),
    );
  }
}
