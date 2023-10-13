import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jewellery_app/src/repository/product_repository/product_repository.dart';
import 'package:jewellery_app/src/screens/card_screen/card_screen.dart';
import 'package:jewellery_app/src/screens/favourite_screen/favourite_screen.dart';
import 'package:jewellery_app/src/screens/home_screen/home_screen.dart';

import '../../common/service/service_locator.dart';
import '../favourite_screen/bloc/favorite_bloc.dart';
import '../home_screen/bloc/home_bloc.dart';
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
      mainScreen: MainScope(
        drawerController: drawerController,
        child: Scaffold(
          /// body
          body: PageView(
            controller: screenController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BlocProvider(
                create: (context) => FavoriteBloc()..add(const FavoriteGetDataEvent()),
                child: const FavouriteScreen(),
              ),
              BlocProvider(
                create: (context) =>
                    HomeBloc(repository: sl<ProductRepository>())
                      ..add(const HomeGetAllDataEvent()),
                child: const HomeScreen(),
              ),
              const CartScreen(),
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
      menuScreen: Container(
        color: Colors.red,
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
