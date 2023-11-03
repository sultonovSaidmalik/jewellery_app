
import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';


class CustomLangButton extends StatelessWidget {
  const CustomLangButton({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
  });

  final void Function() onPressed;
  final String image;
  final String label;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16),
      backgroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 64),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )
    ),
    onPressed: onPressed,
    child: Row(
      children: [
        CircleFlag(image),
        const SizedBox(width: 12,),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}