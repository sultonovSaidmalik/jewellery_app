import 'package:flutter/material.dart';
class GoogleButton extends StatelessWidget {
  final void Function() onTap;
  const GoogleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 47,
          height: 47,
          decoration: const ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(
                  width: 0.80, color: Colors.white),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(
                  "assets/icons/ic_google.png"),
            ),
          ),
        ),
      ),
    );
  }
}
