import 'package:flutter/material.dart';

class ViewCategory extends StatelessWidget {
  const ViewCategory({
    super.key,
    required this.categories,
    required this.category,
    required this.onPress,
  });

  final String category;
  final void Function(String category) onPress;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onPress(categories[index]);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: categories[index] == category
                    ? Colors.white.withOpacity(0.2)
                    : null,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                categories[index],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemCount: categories.length,
      ),
    );
  }
}
