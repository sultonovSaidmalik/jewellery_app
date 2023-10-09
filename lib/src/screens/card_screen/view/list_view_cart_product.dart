import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';
import 'product_description.dart';
import 'widget_photo_jewellery.dart';

class ListViewCartProduct extends StatelessWidget {
  const ListViewCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 12,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final cartItem = state.cart.items[index];
              final product = cartItem.product;
              return GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    /// Photo Jewellery
                    WidgetPhotoJewellery(
                      imageUrl: product.images[0],
                    ),

                    /// Description
                    ProductDescription(
                      name: product.productName ?? "",
                      description: product.productDescription ?? "",
                      price: cartItem.totalPrice,
                      count: cartItem.productCount,
                      increment: () {
                        context.read<CartBloc>().add(CartIncrementProductEvent(
                            productId: product.productId ?? ""));
                      },
                      decrement: () {
                        context.read<CartBloc>().add(CartDecrementProductEvent(
                            productId: product.productId ?? ""));
                      },
                      delete: () {
                        context.read<CartBloc>().add(CartDeleteProductEvent(
                            productId: product.productId ?? ""));
                      },
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              /// Liner
              return Column(
                children: [
                  const SizedBox(height: 15),
                  Divider(
                    height: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const SizedBox(height: 15),
                ],
              );
            },
            itemCount: state.cart.items.length,
          );
        },
      ),
    );
  }
}
