import 'package:flutter/material.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0xFF202020),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: const Center(
        child: Text(
          'Add to Basket',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'SF Pro',
            fontWeight: FontWeight.w800,
            height: 0,
          ),
        ),
      ),
    );
  }
}