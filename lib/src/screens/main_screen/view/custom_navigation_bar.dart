
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int index;
  final void Function(int index) changePage;

  const CustomBottomNavigationBar({
    super.key,
    required this.index,
    required this.changePage,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      height: 80,
      onTap: (index) => changePage(index),
      backgroundColor: const Color(0xFF161614),
      items: [
        BottomNavigationBarItem(
          icon: index == 0
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/ic_favourite.png",
                height: 27,
                width: 30,
              ),
              const SizedBox(height: 10),
              Container(
                height: 2,
                width: 20,
                color: Colors.white,
              ),
            ],
          )
              : Image.asset(
            "assets/icons/ic_favourite.png",
            height: 27,
            width: 30,
          ),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: EdgeInsets.only(bottom: index == 1 ? 30 : 0),
            child: Transform.scale(
              scale: index == 1 ? 2.4 : 1.1,
              child: Image.asset(
                "assets/icons/ic_elmas.png",
                height: 32,
                width: 35,
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: index == 2
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/ic_card.png",
                height: 29,
                width: 37,
              ),
              const SizedBox(height: 10),
              Container(
                height: 2,
                width: 20,
                color: Colors.white,
              ),
            ],
          )
              : Image.asset(
            "assets/icons/ic_card.png",
            height: 29,
            width: 37,
          ),),
      ],
    );
  }
}
