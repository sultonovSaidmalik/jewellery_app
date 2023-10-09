
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
    );
  }
}