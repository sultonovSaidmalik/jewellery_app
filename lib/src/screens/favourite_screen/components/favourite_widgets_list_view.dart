import 'package:flutter/material.dart';
import 'product_description.dart';
import 'widgets_photos.dart';

class FavouriteProductWidgets extends StatelessWidget {
  const FavouriteProductWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: const Row(
              children: [
                /// Photo Uzuk
                WidgetsPhotos(),

                /// Description
                WidgetsProductDescription(),
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
        itemCount: 10,
      ),
    );
  }
}
