import 'package:flutter/material.dart';

import 'producr_description.dart';
import 'widget_photo_jewellery.dart';
class ListViewCartProduct extends StatelessWidget {
  const ListViewCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      flex: 12,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: const Row(
              children: [
                /// Photo Jewellery
                WidgetPhotoJewellery(),

                /// Description
                ProductDescription(),
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
        itemCount: 2,
      ),
    );
  }
}
