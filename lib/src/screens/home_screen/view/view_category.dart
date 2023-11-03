import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/screens/home_screen/home_screen.dart';

class ViewCategory extends StatelessWidget {
  const ViewCategory({
    super.key,
    required this.categories,
    required this.category,
    required this.onPress,
  });

  final CategoryLang category;
  final void Function(CategoryLang category) onPress;
  final List<CategoryLang> categories;

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
                categories[index].currentLocale(context.locale.languageCode),
                style: Styles.w400_12,
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
