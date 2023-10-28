import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';
import 'package:jewellery_app/src/repository/product_repository/product_repository.dart';
import 'package:jewellery_app/src/screens/card_screen/card_screen.dart';
import 'package:jewellery_app/src/screens/favourite_screen/favourite_screen.dart';
import 'package:jewellery_app/src/screens/home_screen/home_screen.dart';

import '../../common/service/service_locator.dart';
import '../favourite_screen/bloc/favorite_bloc.dart';
import '../home_screen/bloc/home_bloc.dart';
import '../view/drawer_widget.dart';
import 'bloc/main_bloc.dart';
import 'view/custom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ZoomDrawerController drawerController = ZoomDrawerController();
  final PageController screenController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: drawerController,
      slideWidth: 300,
      isRtl: true,
      angle: 0.0,
      mainScreen: MainScope(
        drawerController: drawerController,
        child: Scaffold(
          /// body
          body: PageView(
            controller: screenController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              FavouriteScreen(),
              HomeScreen(),
              CartScreen(),
            ],
          ),

          /// bottom
          bottomNavigationBar: BlocConsumer<MainBloc, MainState>(
            builder: (context, state) {
              return CustomBottomNavigationBar(
                index: state.index,
                changePage: (int index) {
                  context.read<MainBloc>().add(MainChangeEvent(index: index));
                },
              );
            },
            listener: (BuildContext context, MainState state) {
              screenController.jumpToPage(state.index);
            },
          ),
        ),
      ),
      menuScreen: DrawerWidget(
        languageOnTap: () {},
        profileOnTap: () {},
        deleteOnTap: () {},
        logOutOnTap: () {},
        languageText: "Language",
        profileText: "Profile",
        deleteText: "Delete Account",
        logOutText: "Log Out",
      ),
    );
  }
}

class MainScope extends InheritedWidget {
  final ZoomDrawerController drawerController;

  const MainScope(
      {required this.drawerController, super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
