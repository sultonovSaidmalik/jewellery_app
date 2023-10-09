import 'package:flutter/material.dart';
import 'package:jewellery_app/src/common/constants/text_style.dart';

import 'view/add_to_basket_button.dart';
import 'view/animatedCircleContainer.dart';
import 'view/back_button.dart';
import 'view/favourite_share_buttons.dart';
import 'view/ring_size_list_view_separated.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController screenController = PageController(initialPage: 0);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        children: const [
                          Image(
                            image: AssetImage("assets/images/img.png"),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: AssetImage("assets/images/img_2.png"),
                            fit: BoxFit.cover,
                          ),
                          Image(
                            image: AssetImage("assets/images/img.png"),
                            fit: BoxFit.cover,
                          ),
                        ],
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

                    MyBackButton(),
                    Padding(
                      padding: EdgeInsets.only(top: 40, right: 20),

                      /// Favourite and Share Buttons

                      child: FavouriteShareButtons(),
                    )
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
                  const Text(
                    '2,99 Carat Diamond\nRing',
                    style: Styles.w700,
                  ),
                  const SizedBox(height: 25),

                  /// Explanation Text

                  const Text(
                    'Explanation',
                    style: Styles.w500_19,
                  ),
                  const SizedBox(height: 15),

                  /// Description

                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).width * 0.4,
                    child: const SingleChildScrollView(
                      child: Text(
                        'Natural diamond mine turns into a more sparkling "diamond" when cut in a special form with a larger cut surface and a dome-like bottom. The difference between diamond and diamond is that diamond has less cut surface and the lower part is flat.',
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
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w400,
                                height: 0,
                              ),
                            ),
                            Text(
                              '10.750 ₺',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},

                          /// Add To Basket Button

                          child: const AddToBasketButton(),
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
    );
  }
}
