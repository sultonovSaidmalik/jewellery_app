import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';

class AppBarTextWidgets extends StatelessWidget {
  const AppBarTextWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
      /// Screen Name
      child: Text(
         Strings.favourite.text,
         style:  Styles.w700_25,
      ),
    );
  }
}
