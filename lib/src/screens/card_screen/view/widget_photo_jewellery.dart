import 'package:flutter/material.dart';

class WidgetPhotoJewellery extends StatelessWidget {
  final String imageUrl;

  const WidgetPhotoJewellery({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        width: 100,
        height: 110,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
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
