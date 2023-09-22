import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/screens/card_screen/card_screen.dart';
import 'package:jewellery_app/src/screens/favourite_screen/favourite_screen.dart';
import 'package:jewellery_app/src/screens/home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController screenController = PageController(initialPage: 1);
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// body
      body: PageView(
        controller: screenController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [FavouriteScreen(), HomeScreen(), CartScreen()],
      ),

      /// bottom
      bottomNavigationBar: CupertinoTabBar(
        height: 80,
        onTap: (page) {
          screenController.jumpToPage(page);
          index = page;
          setState(() {});
        },
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
                    )),
        ],
      ),
    );
  }
}
