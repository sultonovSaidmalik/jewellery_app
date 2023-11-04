import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/models/product_model.dart';
import '../../../common/models/cart_item_model.dart';
import '../../card_screen/bloc/cart_bloc.dart';
import '../../detail_screen/view/add_button_inc_dec.dart';
import '../bloc/favorite_bloc.dart';
import 'button_add_to_basket.dart';

class WidgetsProductDescription extends StatelessWidget {
  final Product product;

  const WidgetsProductDescription({
    super.key,
    required this.product,
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
                  product.productName ?? "",
                  style: Styles.w400,
                ),

                /// Icon more
                GestureDetector(
                  onTap: () {
                    context.read<FavoriteBloc>().add(
                          FavoriteAddEvent(productId: product.productId ?? ""),
                        );
                  },
                  child: const Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            /// Description
            Text(
              product.productDescription ?? "",
              style: Styles.w300,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Flexible(
                  child: Text(
                    "${product.productPrice} ${context.l10n.som}",
                    style: Styles.w700_20,
                  ),
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    final cartItem = state.isProduct(product.productId ?? "");
                    return Stack(
                      children: [
                        if (cartItem == null)
                          ButtonAddToBasket(
                            onTap: () {
                              context.read<CartBloc>().add(
                                    CartAddProductEvent(
                                      cartItem: CartItem(
                                          id: product.productId ?? "",
                                          product: product,
                                          productCount: 1,
                                          totalPrice:
                                              product.productPrice ?? 0),
                                    ),
                                  );
                            },
                          ),
                        if (cartItem != null)
                          AddToIncDec(
                            increment: () {
                              context.read<CartBloc>().add(
                                    CartIncrementProductEvent(
                                        productId: product.productId ?? ""),
                                  );
                            },
                            decrement: () {
                              context.read<CartBloc>().add(
                                    CartDecrementProductEvent(
                                        productId: product.productId ?? ""),
                                  );
                            },
                            count: cartItem.productCount,
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
