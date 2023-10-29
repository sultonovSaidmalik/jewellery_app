import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/screens/main_screen/main_screen.dart';
import 'package:jewellery_app/src/screens/view/custom_indicator.dart';

import '../favourite_screen/bloc/favorite_bloc.dart';
import 'bloc/home_bloc.dart';
import 'view/view_category.dart';
import 'view/view_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["All", "Ring", "Necklace", "Bracelet"];
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if(state.status == FavoriteStatus.successAdded) {
          context.read<FavoriteBloc>().add(const FavoriteGetDataEvent());
        }
        if(state.status == FavoriteStatus.successDelete) {
          context.read<FavoriteBloc>().add(const FavoriteGetDataEvent());
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF000000),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Screen Name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 85),
                                child: Image(
                                  image: AssetImage(
                                    "assets/images/img_ic.png",
                                  ),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              Text(
                                'Elite Diamonds',
                                style: TextStyle(
                                  color: Color(0xFFF5F5F5),
                                  fontSize: 60,
                                  fontFamily: 'Dorsa',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Image(
                                  image:
                                      AssetImage("assets/icons/ic_search.png"),
                                  height: 25,
                                  width: 26,
                                ),
                              ),
                              const SizedBox(width: 8),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .getInheritedWidgetOfExactType<
                                          MainScope>()!
                                      .drawerController
                                      .toggle!();
                                },
                                child: const Image(
                                  image: AssetImage("assets/icons/ic_menu.png"),
                                  height: 25,
                                  width: 30,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      /// Categories name
                      const Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 15),

                      /// Categories List
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          return ViewCategory(
                            categories: categories,
                            category: selectedCategory,
                            onPress: (String category) {
                              selectedCategory = category;
                              context
                                  .read<HomeBloc>()
                                  .add(HomeGetCategoryProductEvent(
                                    category: category,
                                  ));
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 150 / 250,
                            ),
                            itemCount: state.products.length,
                            itemBuilder: (context, index) {
                              final product = state.products[index];
                              return ViewProduct(
                                onPressed: () {
                                  context.push('/view', extra: product);
                                },
                                product: product,
                              );
                            },
                          ),
                          if (state.status == HomeStatus.loading)
                            const CustomIndicator(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
