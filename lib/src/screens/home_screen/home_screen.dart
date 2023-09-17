import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/screens/detail_screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["All products", "Ring", "Necklace", "Bracelet"];
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
                             'Elite Diamond ',
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
                             onTap: (){},
                             child: const Image(
                               image: AssetImage("assets/icons/ic_search.png"),
                               height: 25,
                               width: 26,
                             ),
                           ),
                           const SizedBox(width: 8),
                            GestureDetector(
                              onTap: (){},
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
                   GestureDetector(
                     onTap: () {},
                     child: SizedBox(
                       height: 38,
                       child: ListView.separated(
                         physics: const AlwaysScrollableScrollPhysics(),
                         scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index) {
                           return Container(
                             width: 100,
                             height: 38,
                             decoration: ShapeDecoration(
                               shape: RoundedRectangleBorder(
                                 side:
                                 const BorderSide(width: 1, color: Colors.white),
                                 borderRadius: BorderRadius.circular(10),
                               ),
                             ),
                             child: Center(
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
                     ),
                   ),
                 ],
               ),
             ),
              Expanded(
                flex: 6,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.2/.36,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Stack(
                            children: [
                              CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailScreen(),));
                                },
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/images/img_2.png"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const Alignment(.95,-.85),
                                child: CupertinoButton(
                                  onPressed: (){},
                                  padding: EdgeInsets.zero,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.black,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Image(image: AssetImage("assets/icons/ic_favourite.png"),),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                '1,75 Karat Pırlanta Yüzük',
                                style: TextStyle(
                                  color: Color(0xFFD9D9D9),
                                  fontSize: 10,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              Text(
                                '9.875 ₺',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        )
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
