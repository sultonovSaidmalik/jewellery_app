import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/common/constants/app_router.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/screens/main_screen/main_screen.dart';
import 'package:jewellery_app/src/screens/mixin/connectivity_mixin.dart';
import 'package:jewellery_app/src/screens/view/custom_indicator.dart';

import '../bloc/connectivity/connectivity_bloc.dart';
import '../favourite_screen/bloc/favorite_bloc.dart';
import 'bloc/home_bloc.dart';
import 'view/view_category.dart';
import 'view/view_product.dart';
part './mixin/home_mixin.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with HomeMixin{


  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteBloc, FavoriteState>(
      listener: (context, state) {
        if (state.status == FavoriteStatus.successAdded) {
          context.read<FavoriteBloc>().add(const FavoriteGetDataEvent());
        }
        if (state.status == FavoriteStatus.successDelete) {
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
                          Stack(
                            children: [
                              const Padding(
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
                                context.l10n.eliteDiamonds,
                                style: Styles.w400_60,
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                  .getInheritedWidgetOfExactType<MainScope>()!
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

                      /// Categories name
                      Text(
                        context.l10n.categories,
                        style: Styles.w700_25,
                      ),
                      const SizedBox(height: 15),

                      /// Categories List
                      BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          return ViewCategory(
                            categories: categoryLang,
                            category: selectedCategory,
                            onPress: (category) {
                              selectedCategory = category;
                              context
                                  .read<HomeBloc>()
                                  .add(HomeGetCategoryProductEvent(
                                    category: category.forDB,
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
                                  context.pushNamed(Routes.view, extra: product);
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
