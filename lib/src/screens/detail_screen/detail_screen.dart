import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final PageController screenController = PageController(initialPage: 0);
  int index = 0;

  List<double> size = [
    3.0,
    3.5,
    4.0,
    4.5,
    5.0,
    5.5,
    6.0,
    6.5,
    7.0,
    7.5,
    8.0,
    8.5,
    9.0,
    9.5,
    10.0,
    10.5,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// PagesView Images
          Stack(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      index == i ? Colors.white : Colors.grey),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, right: 20),
                    child: Column(
                      children: [
                        CupertinoButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Image(
                                image:
                                    AssetImage("assets/icons/ic_favourite.png"),
                              ),
                            ),
                          ),
                        ),
                        CupertinoButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Image(
                                image: AssetImage("assets/icons/ic_share.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    /// Text Ring Name
                    Text(
                      '2,99 Carat Diamond\nRing',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                /// Explanation Text
                const Text(
                  'Explanation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                const SizedBox(height: 15),
                /// Description
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: const SingleChildScrollView(
                    child: Text(
                      'Natural diamond mine turns into a more sparkling "diamond" when cut in a special form with a larger cut surface and a dome-like bottom. The difference between diamond and diamond is that diamond has less cut surface and the lower part is flat.',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        color: Color(0xFFD9D9D9),
                        fontSize: 12,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                /// Ring Size
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 100,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Color(0xFF161614),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Expanded(
                        child: Text(
                          'Ring Size',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFFD9D9D9),
                            fontSize: 15,
                            fontFamily: 'SF Pro',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){

                          },
                          child: ListView.separated(
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 42,
                                height: 42,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFF202020),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                child: Center(
                                  child: Text(
                                    size[index].toString(),
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
                              return const SizedBox(width: 20);
                            },
                            itemCount: size.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /// Add to Basket Button
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
                        child: Container(
                          width: 220,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0xFF202020),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Add to Basket',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w800,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
