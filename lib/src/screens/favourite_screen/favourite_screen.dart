import 'package:flutter/material.dart';
import 'components/app_bar_text.dart';
import 'components/favourite_widgets_list_view.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF000000),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarTextWidgets(),
              SizedBox(height: 15),
              FavouriteProductWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
