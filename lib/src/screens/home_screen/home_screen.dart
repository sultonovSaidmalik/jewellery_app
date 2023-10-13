import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jewellery_app/src/screens/main_screen/main_screen.dart';
import 'package:jewellery_app/src/screens/view/custom_indicator.dart';

import 'bloc/home_bloc.dart';
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
    return Scaffold(
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
                                image: AssetImage("assets/icons/ic_search.png"),
                                height: 25,
                                width: 26,
                              ),
                            ),
                            const SizedBox(width: 8),
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
                            context.read<HomeBloc>().add(
                                  HomeGetCategoryProductEvent(
                                    category: category,
                                  ),
                                );
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
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.2 / .36,
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
    );
  }
}

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
