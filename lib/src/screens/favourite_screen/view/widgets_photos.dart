import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WidgetsPhotos extends StatelessWidget {
  final String imageUrl;

  const WidgetsPhotos({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          height: 100,
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: Icon(
              Icons.image,
              color: Colors.grey,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
