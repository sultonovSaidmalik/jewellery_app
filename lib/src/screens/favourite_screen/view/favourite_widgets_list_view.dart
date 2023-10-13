import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/favorite_bloc.dart';
import 'product_description.dart';
import 'widgets_photos.dart';

class FavouriteProductWidgets extends StatelessWidget {
  const FavouriteProductWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 15,
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final product = state.products[index];
              return GestureDetector(
                onTap: () {
                  context.push('/view', extra: product);
                },
                child: Row(
                  children: [
                    /// Photo Jewellery
                    WidgetsPhotos(imageUrl: product.images[0]),

                    /// Description
                    WidgetsProductDescription(product: product),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              /// Liner
              return Column(
                children: [
                  const SizedBox(height: 15),
                  Divider(
                    height: 1,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const SizedBox(height: 15),
                ],
              );
            },
            itemCount: state.products.length,
          );
        },
      ),
    );
  }
}
