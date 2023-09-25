import 'package:flutter/material.dart';
class WidgetPhotoJewellery extends StatelessWidget {
  const WidgetPhotoJewellery({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: 100,
        height: 100,
        decoration: ShapeDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/img.png"),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
