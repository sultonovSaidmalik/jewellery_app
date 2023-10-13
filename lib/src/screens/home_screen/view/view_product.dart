import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_app/src/repository/favorite_repositor/favorite_repositor.dart';

import '../../../common/models/product_model.dart';
import '../../detail_screen/detail_screen.dart';

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
          flex: 4,
          child: Stack(
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onPressed,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(product.images[0]),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(.95, -.85),
                child: CupertinoButton(
                  onPressed: () async{
                    await FavoriteRepositoryImpl()
                        .addFavoriteProduct(product.productId ?? "");
                    print(FavoriteRepositoryImpl().getFavourites());
                  },
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
                      child: Image(
                        image: AssetImage("assets/icons/ic_favourite.png"),
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
                style: const TextStyle(
                  color: Color(0xFFD9D9D9),
                  fontSize: 10,
                  fontFamily: 'SF Pro',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Text(
                '${product.productPrice ?? 0} so`m',
                style: const TextStyle(
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
  }
}
