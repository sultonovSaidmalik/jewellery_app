import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/constants/strings.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';
import 'package:jewellery_app/src/common/ext/product_ext.dart';
import 'package:jewellery_app/src/screens/favourite_screen/bloc/favorite_bloc.dart';

import '../../../common/models/product_model.dart';

class ViewProduct extends StatelessWidget {
  final void Function() onPressed;
  final Product product;

  const ViewProduct({
    super.key,
    required this.onPressed,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    width: double.infinity,
                    height: double.infinity,
                    imageUrl: product.images[0],
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.dangerous_rounded),
                    ),
                    placeholder: (context, url) => const Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.grey,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(.95, -.85),
                child: CupertinoButton(
                  onPressed: () async {
                    context.read<FavoriteBloc>().add(
                        FavoriteAddEvent(productId: product.productId ?? ''));
                  },
                  padding: EdgeInsets.zero,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: BlocBuilder<FavoriteBloc, FavoriteState>(
                        builder: (context, state) {
                          return Icon(
                            Icons.favorite,
                            color: state.products
                                    .isIdEqual(product.productId ?? '')
                                ? Colors.red
                                : Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                product.productName ?? "",
                style: Styles.w400_10,
              ),
              const SizedBox(height: 20),
              Text(
                '${product.productPrice ?? 0} ${Strings.som.text}',
                style: Styles.w700_15
              ),
            ],
          ),
        )
      ],
    );
  }
}
