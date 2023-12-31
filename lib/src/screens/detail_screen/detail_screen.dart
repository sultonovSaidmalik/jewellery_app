import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';
import 'package:jewellery_app/src/common/ext/context_ext.dart';
import 'package:jewellery_app/src/common/models/cart_item_model.dart';
import 'package:jewellery_app/src/screens/card_screen/bloc/cart_bloc.dart';
import 'package:jewellery_app/src/screens/detail_screen/view/add_button_inc_dec.dart';
import 'package:jewellery_app/src/screens/mixin/connectivity_mixin.dart';

import '../../common/models/product_model.dart';
import '../bloc/connectivity/connectivity_bloc.dart';
import 'view/add_to_basket_button.dart';
import 'view/animatedCircleContainer.dart';
import 'view/back_button.dart';

part './mixin/detail_mixin.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with DetailMixin, ConnectivityMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityBloc, bool>(
      listener: checkerListener,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            /// PageView Images
            Expanded(
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).width,
                        child: PageView(
                          controller: screenController,
                          onPageChanged: (value) {
                            setState(() {
                              index = value;
                            });
                          },
                          children: widget.product.images
                              .map(
                                (image) => ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: image,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                    placeholder: (context, url) => const Icon(
                                      Icons.image,
                                      color: Colors.grey,
                                      size: 80,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),

                        /// Row with White and grey Circle AnimatedContainer in PageView

                        child: AnimatedCircleContainerInPageView(index: index),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Back button
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: 10),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: MyBackButton(),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 40, right: 20),
                      //
                      //   /// Favourite and Share Buttons
                      //   child: FavouriteShareButtons(),
                      // ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.productName ?? "",
                      style: Styles.w700,
                    ),
                    const SizedBox(height: 25),

                    /// Explanation Text

                    Text(
                      context.l10n.description,
                      style: Styles.w500_19,
                    ),
                    const SizedBox(height: 15),

                    /// Description

                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).width * 0.4,
                      child: SingleChildScrollView(
                        child: Text(
                          widget.product.productDescription ?? "",
                          overflow: TextOverflow.visible,
                          style: Styles.w400,
                        ),
                      ),
                    ),

                    /// Row Add to Basket Button and Price Texts
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.price,
                                style: Styles.w400_15,
                              ),
                              Text(
                                "${(widget.product.productPrice ?? 0)} ${context.l10n.som}",
                                style: Styles.w700_19,
                              )
                            ],
                          ),
                          BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              final cartItem = state
                                  .isProduct(widget.product.productId ?? "");
                              return Stack(
                                children: [
                                  if (cartItem == null)
                                    GestureDetector(
                                      onTap: addProductCart,

                                      /// Add To Basket Button

                                      child: const AddToBasketButton(),
                                    ),
                                  if (cartItem != null)
                                    AddToIncDec(
                                      increment: () {
                                        context.read<CartBloc>().add(
                                            CartIncrementProductEvent(
                                                productId:
                                                    widget.product.productId ??
                                                        ""));
                                      },
                                      decrement: () {
                                        context.read<CartBloc>().add(
                                            CartDecrementProductEvent(
                                                productId:
                                                    widget.product.productId ??
                                                        ""));
                                      },
                                      count: cartItem.productCount,
                                    ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
