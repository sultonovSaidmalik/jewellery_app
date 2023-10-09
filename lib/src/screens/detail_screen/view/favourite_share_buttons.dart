import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteShareButtons extends StatelessWidget {
  const FavouriteShareButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                image: AssetImage("assets/icons/ic_favourite.png"),
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
    );
  }
}