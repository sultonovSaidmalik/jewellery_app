import 'package:flutter/material.dart';

class AnimatedCircleContainerInPageView extends StatelessWidget {
  const AnimatedCircleContainerInPageView({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  color: index == i ? Colors.white : Colors.grey),
            ),
          ),
      ],
    );
  }
}