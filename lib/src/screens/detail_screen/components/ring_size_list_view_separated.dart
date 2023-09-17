import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RingSizeListViewSeparated extends StatelessWidget {
  const RingSizeListViewSeparated({
    super.key,
    required this.size,
  });

  final List<double> size;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: 42,
          height: 42,
          decoration: ShapeDecoration(
            color: const Color(0xFF202020),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
    );
  }
}