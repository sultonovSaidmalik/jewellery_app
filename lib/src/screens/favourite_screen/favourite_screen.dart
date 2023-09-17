import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
              const Expanded(
                /// Screen Name
                child: Text(
                  'Favourite',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                flex: 15,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){},
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// Uzuk name
                                        const Text(
                                          '2,99 Carat Diamond Ring',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        /// Icon more
                                        GestureDetector(
                                          onTap: (){},
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
                                      style: TextStyle(
                                        color: Color(0xFFD9D9D9),
                                        fontSize: 10,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        /// Price
                                        const Text(
                                          '10.750 ₺',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'SF Pro',
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        /// Add To Card
                                        GestureDetector(
                                          onTap: (){},
                                          child: Container(
                                            width: 120,
                                            height: 35,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFF202020),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(5),
                                              ),
                                            ),
                                            child:const Center(
                                              child: Text(
                                                'Add to Basket',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13,
                                                  fontFamily: 'SF Pro',
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                            )
                                          ),
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
                    return  Column(
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
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
