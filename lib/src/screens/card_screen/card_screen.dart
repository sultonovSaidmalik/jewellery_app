import 'package:flutter/material.dart';
import 'view/bottom_total_price_button.dart';
import 'view/list_view_cart_product.dart';
import 'view/screen_name_and_cart_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              /// Screen name and Clear Cart Button
              ScreenNameAndCartButton(),
              SizedBox(height: 20),
              /// ListView Cart Product
              ListViewCartProduct(),
               /// bottom Total price Button
              BottomTotalPrice(),
            ],
          ),
        ),
      ),
    );
  }
}
