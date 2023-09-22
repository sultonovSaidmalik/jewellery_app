import 'package:flutter/material.dart';

import '../../common/text_style.dart';
import 'components/confirm_cart_button_wiget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cart',
                      style: Styles.w700_25,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color(0xFF202020),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Clear Cart',
                            style: Styles.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 12,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          /// Photo Uzuk
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/img.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          /// Description
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /// Uzuk name
                                      const Text(
                                        '2,99 Carat Diamond Ring',
                                        style: Styles.w400,
                                      ),

                                      /// Icon more
                                      GestureDetector(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.more_vert,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),

                                  /// razmer
                                  const Text(
                                    'Boyut: 3.5',
                                    style: Styles.w300,
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /// Add To Card
                                      Container(
                                        width: 100,
                                        height: 35,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF121210),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color: const Color(0xFF7D7D7D),
                                          ),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                                Container(
                                                  height: 26,
                                                  width: 26,
                                                  decoration:
                                                      const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.black),
                                                  child: const Center(
                                                    child: Text(
                                                      '1',
                                                      style: Styles.w700_16,
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {},
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      /// Price
                                      const Text(
                                        '10.750 ₺',
                                        textAlign: TextAlign.right,
                                        style: Styles.w700_20,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                  itemCount: 2,
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: Styles.w400,
                        ),
                        Text(
                          '10.750 ₺',
                          style: Styles.w700
                        )
                      ],
                    ),
                    /// Confirm Cart Button
                    ConfirmCartButton(onTap: (){},),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
